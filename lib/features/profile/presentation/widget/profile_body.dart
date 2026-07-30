part of 'profile_widgets.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.snapshot});
  final ProfileSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final profile = snapshot.profile;
    final strings = linkVaultLocalizationsOf(context);
    return VelocityPage(
      bottomInset: 64,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.displayName.displayText,
                        style: textTheme.headlineLarge?.copyWith(fontSize: 36),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: LinkVaultColors.primary,
                          borderRadius: LinkVaultThemeTokens.componentRadius,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 6,
                        ),
                        child: Text(
                          profile.authLevel.displayText,
                          style: textTheme.labelLarge?.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 126,
                  height: 126,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: LinkVaultColors.primary,
                      width: 4,
                    ),
                    borderRadius: LinkVaultThemeTokens.componentRadius,
                    gradient: const LinearGradient(
                      colors: [Colors.black, Color(0xFF202020), Colors.black],
                    ),
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color: LinkVaultColors.secondary,
                    size: 54,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    strings.storageCapacity,
                    style: textTheme.headlineMedium,
                  ),
                ),
                Text(
                  '${(profile.storagePercent * 100).round()}%',
                  style: textTheme.headlineMedium?.copyWith(
                    color: LinkVaultColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Container(
              height: 24,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: LinkVaultThemeTokens.ink(context)),
                borderRadius: LinkVaultThemeTokens.componentRadius,
              ),
              child: FractionallySizedBox(
                widthFactor: profile.storagePercent,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: LinkVaultColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        LinkVaultThemeTokens.componentRadiusValue,
                      ),
                      bottomLeft: Radius.circular(
                        LinkVaultThemeTokens.componentRadiusValue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: VelocityStatBox(
                label: strings.linksSaved,
                value: profile.linksSaved.toString(),
                suffix: 'OBJ',
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: VelocityStatBox(
                label: strings.dataUsed,
                value: profile.dataUsedMb.toStringAsFixed(1),
                suffix: 'MB',
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              strings.linkVelocity30d,
              style: textTheme.labelLarge?.copyWith(
                color: LinkVaultColors.secondary,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 20),
            VelocityLineChart(
              values: [for (final metric in snapshot.metrics) metric.value],
              labels: [for (final metric in snapshot.metrics) metric.label],
            ),
          ],
        ),
        Text(
          strings.systemPreferences,
          style: textTheme.labelLarge?.copyWith(
            color: LinkVaultColors.primary,
            fontSize: 15,
          ),
        ),
        Column(
          children: [
            VelocitySettingRow(
              icon: Icons.person_rounded,
              title: strings.identityProfile,
              subtitle: strings.identityProfileDescription,
            ),
            VelocitySettingRow(
              icon: Icons.security_rounded,
              title: strings.encryptionKeys,
              subtitle: strings.encryptionKeysDescription,
            ),
            VelocitySettingRow(
              icon: Icons.notifications_active_rounded,
              title: strings.pulseAlerts,
              subtitle: strings.pulseAlertsDescription,
            ),
            VelocitySettingRow(
              icon: Icons.cloud_sync_rounded,
              title: strings.dataExport,
              subtitle: strings.dataExportDescription,
            ),
          ],
        ),
        VelocityButton(
          label: strings.terminateSession,
          icon: Icons.logout_rounded,
          filled: false,
        ),
        Center(
          child: Text(
            profile.version,
            style: textTheme.labelLarge?.copyWith(
              color: LinkVaultColors.secondary,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
