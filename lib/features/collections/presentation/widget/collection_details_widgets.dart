import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_icon_catalog.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/features/collections/repository/collections_repository.dart';
import 'package:linkvault/features/feed/presentation/widgets/kinetic_link_card.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';
import 'package:linkvault/shared/presentation/widgets/square_button_widget.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_widgets.dart';

part 'collection_details_header.dart';
part 'collection_link_entry.dart';
part 'selectable_collection_link_row.dart';
part 'selection_border_painter.dart';
part 'collection_link_picker_dialog.dart';
part 'archive_collection_dialogs.dart';
