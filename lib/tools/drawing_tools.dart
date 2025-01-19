import 'package:draft_home/models/paint_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class DrawingTools extends StatefulWidget {
  const DrawingTools({Key? key}) : super(key: key);

  @override
  _DrawingToolsState createState() => _DrawingToolsState();
}

class _DrawingToolsState extends State<DrawingTools> {
  void _openColorPicker() {
    showDialog<Color>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('색상'),
          content: BlockPicker(
            pickerColor: context.watch<PaintModel>().selectedColor,
            onColorChanged: (color) {
              context.read<PaintModel>().setColor(color);
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('닫기'),
            ),
          ],
        );
      },
    ).then((selectedColor) {
      if (selectedColor != null) {
        context.read<PaintModel>().setColor(selectedColor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 167, 142, 142),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIconButton(context, Icons.brush, '색상 변경', _openColorPicker),
          _buildIconButton(
              context,
              Icons.crop_square,
              '도형 추가',
              () =>
                  context.read<PaintModel>().setDrawingMode(DrawingMode.shape)),
          _buildIconButton(
              context,
              Icons.pan_tool,
              '이동 도구',
              () =>
                  context.read<PaintModel>().setDrawingMode(DrawingMode.move)),
          _buildIconButton(context, Icons.save, '저장',
              () => context.read<PaintModel>().saveDrawing()),
        ],
      ),
    );
  }

  IconButton _buildIconButton(BuildContext context, IconData icon,
      String tooltip, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, size: 30),
      onPressed: onPressed,
      tooltip: tooltip,
      splashRadius: 24,
      splashColor: Colors.blue.withOpacity(0.3),
      color: Colors.black,
      highlightColor: Colors.blue.withOpacity(0.1),
    );
  }
}
