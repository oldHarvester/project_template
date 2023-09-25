import 'dart:math' as math;

class FileModel {
  const FileModel({
    required this.path,
    required this.bytes,
  });
  final String path;
  final int bytes;

  String get fullName {
    final slashIndex = path.lastIndexOf('/');
    return path.substring(slashIndex + 1, path.length);
  }

  String get formattedSize {
    if (megaBytes < 1) {
      return '${killoBytes.toStringAsFixed(1)} КБ';
    } else {
      return '${megaBytes.toStringAsFixed(1)} МБ';
    }
  }

  String get shortName {
    return '${fullName.substring(0, 20)}.$extension';
  }

  String get nameWithoutExt {
    final dotIndex = fullName.lastIndexOf('.');
    return fullName.substring(0, dotIndex);
  }

  double get killoBytes {
    return bytes / math.pow(2, 10);
  }

  double get megaBytes {
    return bytes / math.pow(2, 20);
  }

  String get extension {
    final dotIndex = path.lastIndexOf('.');
    return path.substring(dotIndex + 1, path.length);
  }
}
