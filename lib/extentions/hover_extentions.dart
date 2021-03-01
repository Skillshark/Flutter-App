import 'package:flutter/material.dart';
import 'package:skillshark/components/translate_on_hover.dart';

extension Hoverextentions on Widget {
  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }
}
