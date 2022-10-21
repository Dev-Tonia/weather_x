import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';
import '../widgets/custom_button.dart';
import 'home_view_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<HomeViewModel>().init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<HomeViewModel>(builder: (context, model, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 26, top: 5),
                child: Row(
                  children: [
                    Image.asset('assets/images/Rectangle 10.png'),
                    const SizedBox(
                      width: 14,
                    ),
                    CustomButton(
                      model: model,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Feels Like A good\ntime to ride a bike in \n${model.weatherModel?.name}-${model.weatherModel?.sys?.country}',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff09151E),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        height: 1.11,
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      height: 280,
                      width: 280,
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            width: 265,
                            height: 265,
                            child: Center(
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: 'Today’s Like',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '\n${model.weatherModel?.main?.temp?.round()}°',
                                    style: GoogleFonts.poppins(
                                      fontSize: 43.9,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            child: Image.asset(
                                'assets/images/Cloudy_day_icon_by_devoart.png'),
                          ),
                          Positioned(
                            bottom: 75,
                            left: -10,
                            child: Image.asset(
                                'assets/images/windy_icon_by_devoart.png'),
                          ),
                          Positioned(
                            bottom: -8,
                            right: 130,
                            child: Image.asset(
                                'assets/images/thundersrtom_icon_by_devoart.png'),
                          ),
                          Positioned(
                            bottom: 75,
                            right: -10,
                            child: Image.asset(
                                'assets/images/Clear_night_icon_by_devoart.png'),
                          ),
                          Positioned(
                            top: 10,
                            right: 37,
                            child: Image.asset(
                                'assets/images/rain_icon_by_devoart.png'),
                          ),
                          Positioned(
                            bottom: 50,
                            right: 45,
                            child: Image.network(
                              'https://openweathermap.org/img/wn/${model.weatherModel?.weather![0].icon}@2x.png',
                              scale: 0.85,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: const [
                        FooterText(
                          title: 'Today’s Mood\n',
                          subtitle: 'Very Good',
                        ),
                        SizedBox(width: 33),
                        FooterText(
                          title: 'Tomorrow’s Mood\n',
                          subtitle: 'Excellent',
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class FooterText extends StatelessWidget {
  const FooterText({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: GoogleFonts.poppins(
          color: const Color(0xff36424D),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        children: [
          WidgetSpan(
            child: TextButton(
              onPressed: () {},
              child: Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0C1823),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
