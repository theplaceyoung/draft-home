import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:draft_home/models/paint_model.dart';
import 'package:draft_home/widgets/common_app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/tools/drawing_tools.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({Key? key}) : super(key: key);

  @override
  _CanvasPageState createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      drawer: CommonDrawer(),
      body: ChangeNotifierProvider(
        create: (_) => PaintModel(),
        child: Consumer<PaintModel>(
          builder: (context, paintModel, _) {
            return Stack(
              children: [
                GestureDetector(
                  onPanUpdate: (details) {
                    RenderBox renderBox =
                        context.findRenderObject() as RenderBox;
                    paintModel.addFreeDraw(
                        [renderBox.globalToLocal(details.globalPosition)]);
                  },
                  onPanEnd: (_) {
                    paintModel.addFreeDraw([]); // 드로잉 종료
                  },
                  child: CustomPaint(
                    painter: DrawingPainter(paintModel.actions),
                    size: Size.infinite,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 20,
                  child: Draggable(
                    feedback: DrawingTools(),
                    childWhenDragging: Container(
                      height: 0,
                    ),
                    child: DrawingTools(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<PaintAction> actions;

  DrawingPainter(this.actions);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.white);

    for (final action in actions) {
      action.draw(canvas);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
