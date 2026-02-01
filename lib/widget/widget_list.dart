import 'package:flutter/material.dart';
import 'package:walmart/widget/form_widget.dart';
import 'package:walmart/widget/image_container.dart';

Map<String, Widget> get widgetList => {
      'logo': ImageContainer(),
      'form': const FormWidget(),
    };
