import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double get statusBarHeight => Platform.isAndroid ? 25.h : kToolbarHeight;
