import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool animated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CheckboxListTile(
            title: Text('Use animated delegate'),
            subtitle:
                Text('controls whether animated / static delegate is used'),
            value: animated,
            onChanged: (v) => setState(() => animated = v!),
          ),
          Expanded(
            child: animated ? SmoothDemoPage() : DemoPage(),
          ),
        ],
      ),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  bool _flagA = true;
  bool _flagB = false;
  double _opacity = 1.0;
  String _label = "Hello";
  final offsetNotifier = ValueNotifier(Offset.zero);

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _DemoPageDelegate(
        offsetNotifier: offsetNotifier,
      ),
      children: [
        // background gradient
        LayoutId(
          id: #background,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surfaceContainerHighest,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        // menu
        LayoutId(
          id: #menu,
          child: _AnchoredMenu(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: _OptionsList(
              flagA: _flagA,
              flagB: _flagB,
              opacity: _opacity,
              label: _label,
              onToggleA: (v) => setState(() => _flagA = v),
              onToggleB: (v) => setState(() => _flagB = v),
              onOpacityChanged: (v) => setState(() => _opacity = v),
              onEditLabel: (newLabel) => setState(() => _label = newLabel),
            ),
          ),
        ),
        // handle
        LayoutId(
          id: #handle,
          child: _DraggableHandle(
            child: _TargetCard(
              label: _label,
              opacity: _opacity,
            ),
            onDrag: (delta) => offsetNotifier.value += delta,
          ),
        ),
      ],
    );
  }
}

final alignLabels = ['left side', 'center', 'right side'];

int _getAlign(Size size, Rect handleRect, Rect menuRect) {
  // right
  if (size.width - handleRect.right > menuRect.width) return 1;
  // left
  if (handleRect.left > menuRect.width) return -1;
  // center
  return 0;
}

class _DemoPageDelegate extends MultiChildLayoutDelegate {
  _DemoPageDelegate({
    required this.offsetNotifier,
  }) : super(relayout: offsetNotifier);

  final ValueNotifier<Offset> offsetNotifier;

  @override
  void performLayout(Size size) {
    layoutChild(#background, BoxConstraints.tight(size));

    final handleSize = layoutChild(#handle, BoxConstraints.loose(size));
    final menuSize =
        layoutChild(#menu, BoxConstraints.loose(size).copyWith(maxWidth: 275));

    // print('handleSize: $handleSize menuSize: $menuSize');

    // position handle
    final handleOffset = Offset(
      offsetNotifier.value.dx.clamp(0, max(size.width - handleSize.width, 0)),
      offsetNotifier.value.dy.clamp(0, max(size.height - handleSize.height, 0)),
    );
    positionChild(#handle, handleOffset);

    // position menu
    final handleRect = handleOffset & handleSize;
    Rect menuRect = Alignment.topCenter.inscribe(menuSize, handleRect);
    final dx = (handleSize.width + menuSize.width) / 2;
    final align = _getAlign(size, handleRect, menuRect);
    print('align: ${alignLabels[align + 1]}');
    positionChild(#menu, menuRect.topLeft.translate(dx * align, 0));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}

// =============================================================================

class SmoothDemoPage extends StatefulWidget {
  const SmoothDemoPage({super.key});

  @override
  State<SmoothDemoPage> createState() => _SmoothDemoPageState();
}

class _SmoothDemoPageState extends State<SmoothDemoPage>
    with SingleTickerProviderStateMixin {
  bool _flagA = true;
  bool _flagB = false;
  double _opacity = 1.0;
  String _label = "Hello";
  final offsetNotifier = ValueNotifier(Offset.zero);
  late final controller =
      AnimationController.unbounded(vsync: this, duration: Durations.medium2);

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _SmoothDemoPageDelegate(
        offsetNotifier: offsetNotifier,
        controller: controller,
      ),
      children: [
        // background gradient
        LayoutId(
          id: #background,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surfaceContainerHighest,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        // menu
        LayoutId(
          id: #menu,
          child: _AnchoredMenu(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: _OptionsList(
              flagA: _flagA,
              flagB: _flagB,
              opacity: _opacity,
              label: _label,
              onToggleA: (v) => setState(() => _flagA = v),
              onToggleB: (v) => setState(() => _flagB = v),
              onOpacityChanged: (v) => setState(() => _opacity = v),
              onEditLabel: (newLabel) => setState(() => _label = newLabel),
            ),
          ),
        ),
        // handle
        LayoutId(
          id: #handle,
          child: _DraggableHandle(
            child: _TargetCard(
              label: _label,
              opacity: _opacity,
            ),
            onDrag: (delta) => offsetNotifier.value += delta,
          ),
        ),
      ],
    );
  }
}

class _SmoothDemoPageDelegate extends MultiChildLayoutDelegate {
  _SmoothDemoPageDelegate({
    required this.offsetNotifier,
    required this.controller,
  }) : super(relayout: Listenable.merge([offsetNotifier, controller]));

  final ValueNotifier<Offset> offsetNotifier;
  final AnimationController controller;
  double _target = double.infinity;

  @override
  void performLayout(Size size) {
    layoutChild(#background, BoxConstraints.tight(size));

    final handleSize = layoutChild(#handle, BoxConstraints.loose(size));
    final menuSize =
        layoutChild(#menu, BoxConstraints.loose(size).copyWith(maxWidth: 275));

    // print('handleSize: $handleSize menuSize: $menuSize');

    // position handle
    final handleOffset = Offset(
      offsetNotifier.value.dx.clamp(0, max(size.width - handleSize.width, 0)),
      offsetNotifier.value.dy.clamp(0, max(size.height - handleSize.height, 0)),
    );
    positionChild(#handle, handleOffset);

    // position menu
    final handleRect = handleOffset & handleSize;
    Rect menuRect = Alignment.topCenter.inscribe(menuSize, handleRect);
    final dx = (handleSize.width + menuSize.width) / 2;
    final align = _getAlign(size, handleRect, menuRect);
    final target = dx * align;
    if (target != _target) {
      print('animate to ${alignLabels[align + 1]}');

      _target = target;
      controller.animateTo(target, curve: Curves.easeOut);
    }
    positionChild(#menu, menuRect.topLeft.translate(controller.value, 0));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}

// =============================================================================

class _AnchoredMenu extends StatelessWidget {
  const _AnchoredMenu({
    required this.child,
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
  });

  final Widget child;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Material(
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(14),
        color: Theme.of(context).colorScheme.surface,
        child: _ScrollIfNeeded(child: child),
      ),
    );
  }
}

// if needed, this becomes a scrollable menu
class _ScrollIfNeeded extends StatelessWidget {
  const _ScrollIfNeeded({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: 0,
            ),
            child: child,
          ),
        );
      },
    );
  }
}

class _TargetCard extends StatelessWidget {
  const _TargetCard({
    required this.label,
    required this.opacity,
  });

  final String label;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Material(
        color: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _DraggableHandle extends StatelessWidget {
  const _DraggableHandle({
    required this.child,
    required this.onDrag,
  });

  final Widget child;
  final ValueChanged<Offset> onDrag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onPanUpdate: (d) => onDrag(d.delta), child: child);
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList({
    required this.flagA,
    required this.flagB,
    required this.opacity,
    required this.label,
    required this.onToggleA,
    required this.onToggleB,
    required this.onOpacityChanged,
    required this.onEditLabel,
  });

  final bool flagA;
  final bool flagB;
  final double opacity;
  final String label;

  final ValueChanged<bool> onToggleA;
  final ValueChanged<bool> onToggleB;
  final ValueChanged<double> onOpacityChanged;
  final ValueChanged<String> onEditLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          title: const Text(
            'Actions',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(Icons.tune),
        ),
        const Divider(height: 1),

        // Clickable entry that opens a modal input field (bottom sheet).
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit label'),
          subtitle: Text(label),
          onTap: () async {
            final newLabel = await _promptForText(
              context: context,
              title: 'Edit Label',
              initial: label,
              hint: 'Enter label',
            );
            if (newLabel != null) onEditLabel(newLabel);
          },
        ),

        // Switches
        SwitchListTile(
          dense: true,
          title: const Text('Enable option A'),
          value: flagA,
          onChanged: onToggleA,
          secondary: const Icon(Icons.flag),
        ),
        SwitchListTile(
          dense: true,
          title: const Text('Enable option B'),
          value: flagB,
          onChanged: onToggleB,
          secondary: const Icon(Icons.flag_circle),
        ),

        // Slider (another parameter control)
        ListTile(
          leading: const Icon(Icons.opacity),
          title: const Text('Opacity'),
          subtitle: Slider(
            value: opacity,
            min: 0.2,
            max: 1.0,
            onChanged: onOpacityChanged,
          ),
        ),

        // Another clickable entry that summons a dialog for numeric input.
        ListTile(
          leading: const Icon(Icons.numbers),
          title: const Text('Set numeric value…'),
          onTap: () async {
            final v = await _promptForNumber(
              context: context,
              title: 'Set a number',
            );
            if (v != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('You set $v')));
            }
          },
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}

Future<String?> _promptForText({
  required BuildContext context,
  required String title,
  String? initial,
  String? hint,
}) async {
  final controller = TextEditingController(text: initial ?? '');
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (ctx) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          top: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(ctx).textTheme.titleMedium),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                border: const OutlineInputBorder(),
              ),
              autofocus: true,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => Navigator.pop(ctx, controller.text.trim()),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, controller.text.trim()),
              child: const Text('Save'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}

Future<double?> _promptForNumber({
  required BuildContext context,
  required String title,
}) async {
  final controller = TextEditingController();
  return showDialog<double>(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'e.g. 42.0',
            border: OutlineInputBorder(),
          ),
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: false,
          ),
          autofocus: true,
          onSubmitted: (_) {
            final v = double.tryParse(controller.text);
            Navigator.pop(ctx, v);
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(ctx, double.tryParse(controller.text)),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
