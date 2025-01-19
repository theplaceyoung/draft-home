import 'package:flutter/material.dart';

/// 개별적인 드로잉 동작(선, 도형 등)을 표현하는 클래스
abstract class PaintAction {
  final Color color;
  final double strokeWidth;

  PaintAction({required this.color, required this.strokeWidth});

  void draw(Canvas canvas);

  /// 직렬화 메서드 (JSON 변환용)
  Map<String, dynamic> toJson();
}

class FreeDrawAction extends PaintAction {
  final List<Offset?> points;

  FreeDrawAction({
    required this.points,
    required Color color,
    required double strokeWidth,
  }) : super(color: color, strokeWidth: strokeWidth);

  @override
  void draw(Canvas canvas) {
    if (points.isEmpty) return;
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'free_draw',
      'points':
          points.map((p) => p != null ? {'x': p.dx, 'y': p.dy} : null).toList(),
      'color': color.value,
      'strokeWidth': strokeWidth,
    };
  }
}

class ShapeAction extends PaintAction {
  final Offset start;
  final Offset end;
  final ShapeType shapeType;

  ShapeAction({
    required this.start,
    required this.end,
    required this.shapeType,
    required Color color,
    required double strokeWidth,
  }) : super(color: color, strokeWidth: strokeWidth);

  @override
  void draw(Canvas canvas) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    switch (shapeType) {
      case ShapeType.rectangle:
        canvas.drawRect(Rect.fromPoints(start, end), paint);
        break;
      case ShapeType.oval:
        canvas.drawOval(Rect.fromPoints(start, end), paint);
        break;
      case ShapeType.line:
        canvas.drawLine(start, end, paint);
        break;
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'shape',
      'shapeType': shapeType.toString(),
      'start': {'x': start.dx, 'y': start.dy},
      'end': {'x': end.dx, 'y': end.dy},
      'color': color.value,
      'strokeWidth': strokeWidth,
    };
  }
}

enum ShapeType { rectangle, oval, line }

enum DrawingMode { pen, shape, move }

class PaintModel with ChangeNotifier {
  List<PaintAction> _actions = []; // 모든 드로잉 액션
  List<PaintAction> _redoStack = []; // undo/redo 스택
  Color _selectedColor = Colors.black; // 기본적으로 검정색 선택
  double _strokeWidth = 4.0; // 현재 펜 굵기
  DrawingMode _drawingMode = DrawingMode.pen; // 'pen', 'shape', 'move' 등 문자열 사용

  List<PaintAction> get actions => _actions;
  Color get selectedColor => _selectedColor;
  double get strokeWidth => _strokeWidth;
  DrawingMode get drawingMode => _drawingMode; // 현재 드로잉 모드

  void setColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  void setStrokeWidth(double width) {
    _strokeWidth = width;
    notifyListeners();
  }

  void setDrawingMode(DrawingMode mode) {
    //드로잉 모드 설정 메서드 추가
    _drawingMode = mode;
    notifyListeners();
  }

  void addFreeDraw(List<Offset> points) {
    _actions.add(FreeDrawAction(
      points: points,
      color: _selectedColor,
      strokeWidth: _strokeWidth,
    ));
    _redoStack.clear();
    notifyListeners();
  }

  void addShape(Offset start, Offset end, ShapeType shapeType) {
    _actions.add(ShapeAction(
      start: start,
      end: end,
      shapeType: shapeType,
      color: _selectedColor,
      strokeWidth: _strokeWidth,
    ));
    _redoStack.clear();
    notifyListeners();
  }

  void undo() {
    if (_actions.isNotEmpty) {
      _redoStack.add(_actions.removeLast());
      notifyListeners();
    }
  }

  void redo() {
    if (_redoStack.isNotEmpty) {
      _actions.add(_redoStack.removeLast());
      notifyListeners();
    }
  }

  void clear() {
    _actions.clear();
    _redoStack.clear();
    notifyListeners();
  }

  void saveDrawing() {
    // 임시 저장 후 상태 유지
    _savedActions = List.from(_actions);
    notifyListeners();
  }

  void exportDrawing(String filePath) {
    // 내보내기 로직 (예: JSON 파일로 저장)
    final data = {
      'actions': _savedActions.map((action) => action.toJson()).toList(),
    };
    // 파일 저장 코드 (ex: FileSaver or File library 이용)
  }

  List<PaintAction> _savedActions = [];

  Map<String, dynamic> toJson() {
    return {
      'actions': _actions.map((action) => action.toJson()).toList(),
    };
  }
}
