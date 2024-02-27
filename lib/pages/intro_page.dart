import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legrandweb_test_ui/components/buttons.dart';
import 'package:legrandweb_test_ui/models/intro_content.dart';
import 'package:legrandweb_test_ui/pages/login_page.dart';
import 'package:legrandweb_test_ui/utils/constants.dart';
import 'package:legrandweb_test_ui/utils/functions.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController? _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'Passer',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: introductionDataList.length,
                itemBuilder: (context, index) => IntroductionContentWidget(
                    intro: introductionDataList[index]),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    introductionDataList.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: DotIndicator(
                            isActive: index == _pageIndex,
                          ),
                        )),
              ],
            ),
            const SizedBox(height: 100),
            Buttons.circularButton(
              () => MyFunctions.changePageWithoutAnimation(
                  context, const LoginPage()),
            ),
          ],
        ),
      ),
    );
  }
}

class IntroductionContentWidget extends StatelessWidget {
  final IntroContent intro;
  const IntroductionContentWidget({
    super.key,
    required this.intro,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 300),
        Text(
          intro.title,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.05,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          intro.description,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: 15,
              color: const Color(0xFfA0A4AB),
              fontWeight: FontWeight.w400),
        ),
        const Spacer(),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryItemColor : null,
        border: isActive
            ? null
            : Border.all(
                color: isActive ? const Color(0xFFE8F1FF) : kPrimaryItemColor,
                width: isActive ? 1 : 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
