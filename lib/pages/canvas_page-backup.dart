import 'package:draft_home/widgets/common_app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:draft_home/tools/drawing_tools.dart';
import 'package:draft_home/models/paint_model.dart'; // paint_model 경로에 맞게 변경

class CanvasPage extends StatelessWidget {
  const CanvasPage({super.key});
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
    // 배경 지우기
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.white);

    for (final action in actions) {
      action.draw(canvas); // 각 액션을 캔버스에 그리기
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
