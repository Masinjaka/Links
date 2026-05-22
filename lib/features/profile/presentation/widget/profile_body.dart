part of 'profile_widgets.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, required this.snapshot});

  final ProfileSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final profile = snapshot.profile;

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
                        profile.displayName,
                        style: textTheme.headlineLarge?.copyWith(fontSize: 42),
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
                          profile.authLevel,
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
                    'STORAGE_CAPACITY',
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
                label: 'LINKS_SAVED',
                value: profile.linksSaved.toString(),
                suffix: 'OBJ',
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: VelocityStatBox(
                label: 'DATA_USED',
                value: profile.dataUsedMb.toStringAsFixed(1),
                suffix: 'MB',
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'LINK_VELOCITY_30D',
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
          'SYSTEM_PREFERENCES',
          style: textTheme.labelLarge?.copyWith(
            color: LinkVaultColors.primary,
            fontSize: 15,
          ),
        ),
        const Column(
          children: [
            VelocitySettingRow(
              icon: Icons.person_rounded,
              title: 'Identity Profile',
              subtitle: 'Manage your digital signature',
            ),
            VelocitySettingRow(
              icon: Icons.security_rounded,
              title: 'Encryption Keys',
              subtitle: 'Vault security & 2FA',
            ),
            VelocitySettingRow(
              icon: Icons.notifications_active_rounded,
              title: 'Pulse Alerts',
              subtitle: 'Sync and link notifications',
            ),
            VelocitySettingRow(
              icon: Icons.cloud_sync_rounded,
              title: 'Data Export',
              subtitle: 'Download vault archive (.json)',
            ),
          ],
        ),
        const VelocityButton(
          label: 'TERMINATE_SESSION',
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
