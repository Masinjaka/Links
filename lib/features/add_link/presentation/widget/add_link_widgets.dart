import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';
import 'package:linkvault/shared/presentation/widgets/page_title_widget.dart';
import 'package:linkvault/shared/presentation/widgets/square_button_widget.dart';

part 'add_link_page_header.dart';
part 'add_link_title_block.dart';
part 'add_link_metadata_preview.dart';
part 'skeleton_bar.dart';
part 'preview_visual.dart';
part 'preview_fallback_icon.dart';
part 'preview_loading_content.dart';
part 'preview_resolved_content.dart';
part 'preview_error_content.dart';
