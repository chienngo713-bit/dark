import 'package:flutter/material.dart';

void main() => runApp(const ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const ink = Color(0xFF17243B);
  static const muted = Color(0xFF64748B);
  static const line = Color(0xFFE8EDF4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 22, 24, 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopBar(),
                  const SizedBox(height: 22),
                  _buildProfileHeader(),
                  const SizedBox(height: 24),
                  _buildStats(),
                  const SizedBox(height: 20),
                  _buildAbout(),
                  const SizedBox(height: 18),
                  _buildSkills(),
                  const SizedBox(height: 18),
                  _buildProjects(),
                  const SizedBox(height: 18),
                  _buildContact(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          _outlinedIcon(Icons.chevron_left, const Color(0xFF18B774)),
          const Expanded(
            child: Text(
              'Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ink,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          _outlinedIcon(Icons.share_outlined, const Color(0xFFE849B7)),
        ],
      ),
    );
  }

  Widget _outlinedIcon(IconData icon, Color color) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(icon, size: 17, color: ink),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFF58C83), width: 2),
              ),
              child: const CircleAvatar(
                radius: 38,
                backgroundColor: Color(0xFFE2E8F0),
                backgroundImage: AssetImage('images/profile/avatar.jpg'),
              ),
            ),
            Positioned(
              right: 2,
              bottom: 3,
              child: Container(
                width: 17,
                height: 17,
                decoration: BoxDecoration(
                  color: const Color(0xFF1687F8),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 10),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        const Text(
          'Alex Rivers',
          style: TextStyle(
            color: ink,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'Lead Mobile Engineer',
          style: TextStyle(color: muted, fontSize: 10),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: line),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.location_on_outlined, color: muted, size: 11),
              SizedBox(width: 3),
              Text('Tokyo, Japan', style: TextStyle(color: muted, fontSize: 9)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D17243B),
            blurRadius: 14,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: const Row(
        children: [
          _Stat(value: '148', label: 'Projects'),
          _Stat(value: '9 Yrs', label: 'Experience'),
          _Stat(value: '4.9 ★', label: 'Rating', accent: Color(0xFFEAA900)),
        ],
      ),
    );
  }

  Widget _buildAbout() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: TextStyle(
            color: ink,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant solutions and great user experiences.',
          style: TextStyle(color: muted, fontSize: 9, height: 1.55),
        ),
      ],
    );
  }

  Widget _buildSkills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills & Expertise',
          style: TextStyle(
            color: ink,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 7,
          children: const [
            _SkillChip('⚒', 'Flutter', Color(0xFFE0F2FE), Color(0xFF0284C7)),
            _SkillChip('‹›', 'Dart', Color(0xFFDCFCE7), Color(0xFF16834A)),
            _SkillChip('☷', 'Clean Arch', Color(0xFFFFE4E6), Color(0xFFE11D48)),
            _SkillChip('◇', 'UI/UX', Color(0xFFF3E8FF), Color(0xFF9333EA)),
            _SkillChip('♨', 'Firebase', Color(0xFFFFF1CC), Color(0xFFCA8A04)),
          ],
        ),
      ],
    );
  }

  Widget _buildProjects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Projects',
          style: TextStyle(
            color: ink,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Expanded(
              child: _ProjectCard(
                title: 'E-Shop Flutter',
                subtitle: 'Mobile App • 2026',
                imagePath: 'images/profile/avana2.jpg',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _ProjectCard(
                title: 'Crypto Vault',
                subtitle: 'Finance • Clean Arch',
                imagePath: 'images/profile/avana3.jpg',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContact() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: line),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: const [
          _ContactRow(
            icon: Icons.alternate_email,
            title: 'Contact Information',
            header: true,
          ),
          Divider(height: 1, color: Color(0xFFF1F4F8)),
          _ContactRow(icon: Icons.mail_outline, title: 'alex.rivers@email.com'),
          Divider(height: 1, color: Color(0xFFF1F4F8)),
          _ContactRow(icon: Icons.phone_outlined, title: '+81 (90) 1234-5678'),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  final Color accent;

  const _Stat({
    required this.value,
    required this.label,
    this.accent = ProfileScreen.ink,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: accent,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(color: ProfileScreen.muted, fontSize: 8),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String icon;
  final String label;
  final Color background;
  final Color foreground;

  const _SkillChip(this.icon, this.label, this.background, this.foreground);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            icon,
            style: TextStyle(
              color: foreground,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: foreground,
              fontSize: 8,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const _ProjectCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE7ECF2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 6, 5, 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ProfileScreen.ink,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ProfileScreen.muted,
                    fontSize: 7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool header;

  const _ContactRow({
    required this.icon,
    required this.title,
    this.header = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: header ? 38 : 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF718096), size: 14),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: ProfileScreen.ink,
                  fontSize: header ? 9 : 8,
                  fontWeight: header ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
            Icon(
              header ? Icons.chevron_right : Icons.chevron_right,
              color: const Color(0xFF94A3B8),
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
