import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire_knock/controllers/home_controller/home_controller.dart';
import 'package:hire_knock/core/app_constants/app_colors.dart';
import 'package:hire_knock/models/job/job.dart';
import 'package:hire_knock/utils/utils.dart';
import 'package:hire_knock/widgets/button/h_link_button.dart';
import 'package:hire_knock/widgets/chip/h_chip.dart';
import 'package:hire_knock/widgets/container/h_container.dart';
import 'package:hire_knock/widgets/spacing/h_space.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  CupertinoIcons.calendar,
                  color: AppColor.grey,
                ),
                HSpace.horizonital(5),
                HText(
                  text: Utils.dateFormatWithoutTime(
                    DateTime.now(),
                  ),
                  color: AppColor.grey,
                ),
              ],
            ),
            HSpace.vertical(20),
            const HText(
              text: 'Find your perfect job',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            HSpace.vertical(20),
            HContainer(
              height: 200,
              width: double.infinity,
              borderRadius: BorderRadius.circular(30),
              color: AppColor.fieldTextColor,
            ),
            HSpace.vertical(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HText(
                  text: 'Recommendations',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                HLinkButton(
                  onPressed: () {},
                  text: 'Show All',
                ),
              ],
            ),
            HSpace.vertical(20),
            ...List.generate(
                20,
                (index) => _buildJobCard(
                      Job(
                        id: '${index + 1}',
                        companyId: '333',
                        jobTitle: 'MERN STACK DEVELOPER',
                        description:
                            'Looking for well skilled mern stack developers.',
                        requirements:
                            'Skills required : React , JS, Node js , MongoDB',
                        noOfPositions: 2,
                        jobType: 'Remote',
                        location: 'Banglore',
                      ),
                    )),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(Job job) {
    return HContainer(
      width: 500,
      color: Colors.white,
      border: Border.all(
        color: AppColor.fieldColor,
      ),
      borderRadius: BorderRadius.circular(5),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const HContainer(
                height: 30,
                width: 30,
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              HSpace.horizonital(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  HText(
                    text: job.jobTitle ?? '',
                  ),
                  const HText(
                    text: 'OVO',
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                CupertinoIcons.bookmark,
              ),
            ],
          ),
          HSpace.vertical(20),
          Row(
            children: [
              const Icon(
                CupertinoIcons.location_solid,
              ),
              HSpace.horizonital(5),
              HText(
                text: job.location ?? '',
                fontSize: 14,
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                CupertinoIcons.money_dollar,
              ),
              HSpace.horizonital(5),
              const HText(
                text: '\$400 - \$900',
                fontSize: 14,
              ),
            ],
          ),
          HSpace.vertical(20),
          const Row(
            children: [
              HChip(
                text: 'Remote',
                backgroundColor: AppColor.fieldColor,
                textColor: AppColor.fieldTextColor,
                fontSize: 14,
              ),
            ],
          ),
          const Divider(
            color: AppColor.fieldTextColor,
          ),
          Row(
            children: [
              const Icon(CupertinoIcons.timer),
              const HText(text: '1 Day ago = '),
              HText(
                text: '${job.noOfPositions} Participants',
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyData() => const Center(
        child: HText(
          text: 'No recommendations available.',
          fontSize: 15,
          textAlign: TextAlign.center,
        ),
      );
}
