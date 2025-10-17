// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_morozteam_ui/flutter_morozteam_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter MorozTeam UI Demo',
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
        brightness: Brightness.light,
      ),
      home: Builder(
        builder: (context) {
          // Set global context for dialogs
          setGlobalContext(context);
          return const UIThemeProvider(
            config: _demoConfig,
            child: DemoHomePage(),
          );
        },
      ),
    );
  }
}

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({super.key});

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  int _selectedTab = 0;

  final List<Widget> _pages = const [
    ButtonsDemo(),
    TypographyDemo(),
    FormsDemo(),
    ComponentsDemo(),
    LayoutDemo(),
    NewComponentsDemo(),
  ];

  final List<String> _tabTitles = const [
    'Buttons',
    'Typography',
    'Forms',
    'Components',
    'Layout',
    'New',
  ];

  @override
  Widget build(BuildContext context) {
    return MTPage(
      navBar: MTTopBar(
        pageTitle: _tabTitles[_selectedTab],
      ),
      body: _pages[_selectedTab],
      bottomBar: MTBottomBar(
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_tabTitles.length, (index) {
            final isSelected = index == _selectedTab;
            return Expanded(
              child: MTButton.icon(
                Icon(
                  _getIconForTab(index),
                  color: isSelected ? colors.mainColor : colors.f3Color,
                ),
                onTap: () => setState(() => _selectedTab = index),
              ),
            );
          }),
        ),
      ),
    );
  }

  IconData _getIconForTab(int index) {
    switch (index) {
      case 0: return CupertinoIcons.square_grid_2x2;
      case 1: return CupertinoIcons.textformat;
      case 2: return CupertinoIcons.doc_text;
      case 3: return CupertinoIcons.cube_box;
      case 4: return CupertinoIcons.rectangle_3_offgrid;
      case 5: return CupertinoIcons.star;
      default: return CupertinoIcons.square;
    }
  }
}

// ==================== BUTTONS DEMO ====================

class ButtonsDemo extends StatelessWidget {
  const ButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(constants.P3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const H2('Button Types'),
          SizedBox(height: constants.P2),
          
          MTButton.main(
            titleText: 'Main Button',
            onTap: () => _showMessage(context, 'Main button pressed'),
          ),
          SizedBox(height: constants.P2),
          
          MTButton.secondary(
            titleText: 'Secondary Button',
            onTap: () => _showMessage(context, 'Secondary button pressed'),
          ),
          SizedBox(height: constants.P2),
          
          MTButton.danger(
            titleText: 'Danger Button',
            onTap: () => _showMessage(context, 'Danger button pressed'),
          ),
          SizedBox(height: constants.P2),
          
          MTButton.safe(
            titleText: 'Safe Button',
            onTap: () => _showMessage(context, 'Safe button pressed'),
          ),
          SizedBox(height: constants.P2),
          
          MTButton(
            titleText: 'Text Button',
            onTap: () => _showMessage(context, 'Text button pressed'),
          ),
          SizedBox(height: constants.P3),
          
          const H2('Icon Buttons'),
          SizedBox(height: constants.P2),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MTButton.icon(
                const PlusIcon(),
                onTap: () => _showMessage(context, 'Add'),
              ),
              MTButton.icon(
                const CloseIcon(),
                onTap: () => _showMessage(context, 'Close'),
              ),
              MTButton.icon(
                const CheckIcon(),
                onTap: () => _showMessage(context, 'Check'),
              ),
              MTButton.icon(
                const SearchIcon(),
                onTap: () => _showMessage(context, 'Search'),
              ),
              MTButton.icon(
                const SettingsIcon(),
                onTap: () => _showMessage(context, 'Settings'),
              ),
            ],
          ),
          SizedBox(height: constants.P3),
          
          const H2('Loading States'),
          SizedBox(height: constants.P2),
          
          MTButton.main(
            titleText: 'Loading Button',
            loading: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Button Pressed'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

// ==================== TYPOGRAPHY DEMO ====================

class TypographyDemo extends StatelessWidget {
  const TypographyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(constants.P3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const H2('Headings'),
          SizedBox(height: constants.P2),
          
          const H1('Heading 1'),
          const H2('Heading 2'),
          const H3('Heading 3'),
          SizedBox(height: constants.P3),
          
          const H2('Text Styles'),
          SizedBox(height: constants.P2),
          
          const BaseText('Base Text - Regular'),
          const BaseText.medium('Base Text - Medium'),
          const BaseText.bold('Base Text - Bold'),
          const SmallText('Small Text'),
          const NumbersText('123,456.78'),
          const LinkText('Link Text'),
          SizedBox(height: constants.P3),
          
          const H2('Text Colors'),
          SizedBox(height: constants.P2),
          
          const BaseText('Default color (F1)'),
          const BaseText.f2('Secondary color (F2)'),
          const BaseText.f3('Tertiary color (F3)'),
          SizedBox(height: constants.P3),
          
          const H2('Color Palette'),
          SizedBox(height: constants.P2),
          
          _ColorPalette(),
        ],
      ),
    );
  }
}

class _ColorPalette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiColors = colors;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ColorSection('Background', [
          _ColorBox('B0', uiColors.b0Color),
          _ColorBox('B1', uiColors.b1Color),
          _ColorBox('B2', uiColors.b2Color),
          _ColorBox('B3', uiColors.b3Color),
        ]),
        SizedBox(height: constants.P2),
        
        _ColorSection('Foreground', [
          _ColorBox('F1', uiColors.f1Color),
          _ColorBox('F2', uiColors.f2Color),
          _ColorBox('F3', uiColors.f3Color),
        ]),
        SizedBox(height: constants.P2),
        
        _ColorSection('Accent', [
          _ColorBox('Main', uiColors.mainColor),
          _ColorBox('Danger', uiColors.dangerColor),
          _ColorBox('Safe', uiColors.safeColor),
          _ColorBox('Warning', uiColors.warningColor),
        ]),
      ],
    );
  }
}

class _ColorSection extends StatelessWidget {
  const _ColorSection(this.title, this.colors);
  
  final String title;
  final List<_ColorBox> colors;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText.medium(title),
        SizedBox(height: constants.P),
        Wrap(
          spacing: constants.P,
          runSpacing: constants.P,
          children: colors,
        ),
      ],
    );
  }
}

class _ColorBox extends StatelessWidget {
  const _ColorBox(this.label, this.color);
  
  final String label;
  final Color color;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.resolve(context),
            borderRadius: BorderRadius.circular(constants.P),
            border: Border.all(color: colors.f3Color.resolve(context)),
          ),
        ),
        SizedBox(height: constants.P_2),
        SmallText(label),
      ],
    );
  }
}

// ==================== FORMS DEMO ====================

class FormsDemo extends StatefulWidget {
  const FormsDemo({super.key});

  @override
  State<FormsDemo> createState() => _FormsDemoState();
}

class _FormsDemoState extends State<FormsDemo> {
  final _textController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _checkbox1 = false;
  bool _checkbox2 = true;
  String? _dropdown = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(constants.P3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const H2('Text Fields'),
          SizedBox(height: constants.P2),
          
          MTTextField(
            controller: _textController,
            label: 'Username',
            hint: 'Enter your username',
            helper: 'This is a helper text',
          ),
          
          MTTextField.email(
            controller: _emailController,
            label: 'Email',
            hint: 'example@email.com',
          ),
          
          MTTextField.password(
            controller: _passwordController,
            label: 'Password',
            hint: 'Enter password',
          ),
          
          MTTextField(
            label: 'Message',
            hint: 'Enter your message',
            maxLines: 4,
          ),
          
          SizedBox(height: constants.P3),
          const H2('Checkboxes'),
          SizedBox(height: constants.P2),
          
          MTCard(
            child: Column(
              children: [
                MTCheckBoxTile(
                  title: 'Enable notifications',
                  description: 'Receive push notifications',
                  value: _checkbox1,
                  onChanged: (value) => setState(() => _checkbox1 = value ?? false),
                ),
                MTCheckBoxTile(
                  title: 'Auto-update',
                  description: 'Update app automatically',
                  value: _checkbox2,
                  onChanged: (value) => setState(() => _checkbox2 = value ?? false),
                  bottomDivider: true,
                ),
              ],
            ),
          ),
          
          SizedBox(height: constants.P3),
          const H2('Dropdown'),
          SizedBox(height: constants.P2),
          
          MTDropdown<String>(
            label: 'Select option',
            value: _dropdown,
            items: const ['Option 1', 'Option 2', 'Option 3'],
            onChanged: (value) => setState(() => _dropdown = value),
          ),
          
          SizedBox(height: constants.P3),
          
          MTButton.main(
            titleText: 'Submit Form',
            onTap: () => _showMessage(context, 'Form submitted!'),
          ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

// ==================== COMPONENTS DEMO ====================

class ComponentsDemo extends StatelessWidget {
  const ComponentsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(constants.P3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const H2('Cards'),
          SizedBox(height: constants.P2),
          
          MTCard(
            padding: EdgeInsets.all(constants.P3),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H3('Card Title'),
                BaseText('This is a card with shadow and rounded corners.'),
              ],
            ),
          ),
          
          SizedBox(height: constants.P3),
          const H2('List Items'),
          SizedBox(height: constants.P2),
          
          MTCard(
            child: Column(
              children: [
                MTListTile(
                  leading: const PlusIcon(),
                  titleText: 'Add Item',
                  trailing: const ChevronRightIcon(),
                  onTap: () {},
                ),
                MTListTile(
                  leading: const SettingsIcon(),
                  titleText: 'Settings',
                  subtitle: const SmallText('Configure app settings'),
                  trailing: const ChevronRightIcon(),
                  bottomDivider: true,
                  onTap: () {},
                ),
              ],
            ),
          ),
          
          SizedBox(height: constants.P3),
          const H2('Progress Indicators'),
          SizedBox(height: constants.P2),
          
          MTCard(
            padding: EdgeInsets.all(constants.P3),
            child: Column(
              children: [
                const BaseText('Circular Progress'),
                SizedBox(height: constants.P2),
                const MTCircularProgress(),
                SizedBox(height: constants.P3),
                
                const BaseText('Progress Bar'),
                SizedBox(height: constants.P2),
                SizedBox(
                  height: constants.P,
                  child: MTProgress(0.7, color: colors.mainColor),
                ),
              ],
            ),
          ),
          
          SizedBox(height: constants.P3),
          const H2('Dividers'),
          SizedBox(height: constants.P2),
          
          const BaseText('Above divider'),
          const MTDivider(),
          const BaseText('Below divider'),
          
          SizedBox(height: constants.P3),
          const H2('Icons'),
          SizedBox(height: constants.P2),
          
          Wrap(
            spacing: constants.P2,
            runSpacing: constants.P2,
            children: const [
              PlusIcon(size: 32),
              CloseIcon(size: 32),
              BackIcon(size: 32),
              CheckIcon(size: 32),
              InfoIcon(size: 32),
              WarningIcon(size: 32),
              EditIcon(size: 32),
              DeleteIcon(size: 32),
              SearchIcon(size: 32),
              SettingsIcon(size: 32),
              MenuIcon(size: 32),
              ChevronDownIcon(size: 32),
              ChevronUpIcon(size: 32),
              ChevronRightIcon(size: 32),
              ChevronLeftIcon(size: 32),
            ],
          ),
          
          SizedBox(height: constants.P3),
          const H2('Circles'),
          SizedBox(height: constants.P2),
          
          Row(
            children: [
              MTCircle(color: colors.mainColor, size: 40),
              SizedBox(width: constants.P2),
              MTCircle(color: colors.dangerColor, size: 40),
              SizedBox(width: constants.P2),
              MTCircle(color: colors.safeColor, size: 40),
            ],
          ),
        ],
      ),
    );
  }
}

// ==================== LAYOUT DEMO ====================

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(constants.P3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const H2('Adaptive Containers'),
          SizedBox(height: constants.P2),
          
          MTAdaptive.xxs(
            child: Container(
              padding: EdgeInsets.all(constants.P2),
              color: colors.mainColor.resolve(context).withValues(alpha: 0.1),
              child: const BaseText('XXS Container (max 290px)'),
            ),
          ),
          SizedBox(height: constants.P2),
          
          MTAdaptive.s(
            child: Container(
              padding: EdgeInsets.all(constants.P2),
              color: colors.safeColor.resolve(context).withValues(alpha: 0.1),
              child: const BaseText('S Container (max 480px)'),
            ),
          ),
          
          SizedBox(height: constants.P3),
          const H2('Shadowed Container'),
          SizedBox(height: constants.P2),
          
          MTShadowed(
            child: Container(
              height: 200,
              color: colors.b3Color.resolve(context),
              child: const Center(
                child: BaseText('Container with top shadow'),
              ),
            ),
          ),
          
          SizedBox(height: constants.P3),
          const H2('Background Gradient'),
          SizedBox(height: constants.P2),
          
          MTBackgroundWrapper(
            Container(
              height: 150,
              child: const Center(
                child: BaseText('Container with gradient background'),
              ),
            ),
          ),
          
          SizedBox(height: constants.P3),
          const H2('Spacing System'),
          SizedBox(height: constants.P2),
          
          MTCard(
            padding: EdgeInsets.all(constants.P2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText('P = ${constants.P}'),
                BaseText('P2 = ${constants.P2}'),
                BaseText('P3 = ${constants.P3}'),
                BaseText('P4 = ${constants.P4}'),
                BaseText('P6 = ${constants.P6}'),
                BaseText('P8 = ${constants.P8}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== NEW COMPONENTS DEMO ====================

class NewComponentsDemo extends StatefulWidget {
  const NewComponentsDemo({super.key});

  @override
  State<NewComponentsDemo> createState() => _NewComponentsDemoState();
}

class _NewComponentsDemoState extends State<NewComponentsDemo> {
  final _phoneController = TextEditingController();
  PhoneCountry _selectedCountry = PhoneCountry.values.first;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(constants.P3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const H2('Alert Dialog'),
          SizedBox(height: constants.P2),
          
          MTButton.main(
            titleText: 'Show Alert Dialog',
            onTap: () => _showAlertDialog(context),
          ),
          SizedBox(height: constants.P3),
          
          const H2('Snackbar'),
          SizedBox(height: constants.P2),
          
          MTButton.secondary(
            titleText: 'Show Snackbar',
            onTap: () => _showSnackbar(context),
          ),
          SizedBox(height: constants.P3),
          
          const H2('Avatar Examples'),
          SizedBox(height: constants.P2),
          
          Row(
            children: [
              MTAvatar(20, user: _demoUser),
              SizedBox(width: constants.P2),
              MTAvatar(30, user: _demoUser),
              SizedBox(width: constants.P2),
              MTAvatar(40, user: _demoUser),
            ],
          ),
          SizedBox(height: constants.P3),
          
          const H2('Image Examples'),
          SizedBox(height: constants.P2),
          
          MTImage('no_info', height: 100, width: 100),
          SizedBox(height: constants.P2),
          
          MTNetworkImage('https://picsum.photos/200/200', height: 100, width: 100),
          SizedBox(height: constants.P3),
          
          const H2('Field Examples'),
          SizedBox(height: constants.P2),
          
          MTField(
            _demoFieldData,
            leading: const Icon(Icons.person),
            value: const BaseText('John Doe'),
            trailing: const Icon(Icons.edit),
          ),
          SizedBox(height: constants.P2),
          
          MTField(
            _demoFieldDataEmpty,
            leading: const Icon(Icons.email),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(height: constants.P3),
          
          const H2('Phone Field'),
          SizedBox(height: constants.P2),
          
          MTPhoneField(
            controller: _phoneController,
            country: _selectedCountry,
            onChangeCountry: (country) => setState(() => _selectedCountry = country),
            label: 'Phone Number',
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context) async {
    final result = await showMTAlertDialog<String>(
      title: 'Alert Dialog',
      description: 'This is an alert dialog example',
      actions: [
        const MTDialogAction(title: 'Cancel', result: 'cancel'),
        const MTDialogAction(title: 'OK', result: 'ok', type: MTButtonType.main),
      ],
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Result: $result')),
      );
    }
  }

  void _showSnackbar(BuildContext context) async {
    await showMTSnackbar(
      'This is a snackbar dialog example',
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Snackbar tapped!')),
        );
      },
    );
  }
}

// Demo data
const _demoUser = User(
  hasAvatar: false,
  initials: 'JD',
);

const _demoFieldData = MTFieldData(
  1,
  label: 'Name',
  placeholder: 'Enter your name',
  text: 'John Doe',
);

const _demoFieldDataEmpty = MTFieldData(
  2,
  label: 'Email',
  placeholder: 'Enter your email',
);

// ==================== CONFIG ====================

const _demoConfig = UIKitConfig(
  // Background colors
  b0Color: Color(0xFF000000),
  b1Color: Color(0xFF1C1C1E),
  b2Color: Color(0xFFFFFFFF),
  b3Color: Color(0xFFF2F2F7),
  
  // Text colors
  f1Color: Color(0xFF000000),
  f2Color: Color(0xFF3C3C43),
  f3Color: Color(0xFF8E8E93),
  
  // Accent colors
  mainColor: Color(0xFF007AFF),
  dangerColor: Color(0xFFFF3B30),
  safeColor: Color(0xFF34C759),
  warningColor: Color(0xFFFF9500),
  
  // Special colors
  mainBtnTitleColor: Color(0xFFFFFFFF),
  navbarColor: Color(0xFFF9F9F9),
  defaultBarrierColor: Color(0x80000000),
  
  // Typography
  baseFontSize: 16.0,
  fontFamily: '.SF Pro Text',
  fontFamilyNumbers: '.SF Mono',
  fontFamilyDecorative: '.SF Pro Display',
  
  // Spacing
  baseSpacing: 6.0,
  
  // Border radius
  defaultBorderRadius: 12.0,
  
  // Elevation
  cardElevation: 1.0,
  buttonElevation: 1.0,
  
  // Sizes
  minButtonHeight: 48.0,
  defaultBarHeight: 56.0,
  tappableIconSize: 44.0,
);
