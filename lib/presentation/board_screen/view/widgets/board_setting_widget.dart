import 'package:flutter/material.dart';
import 'package:task_management_app/styles/colors.dart';

class BoardSettingWidget extends StatelessWidget {
  const BoardSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * .90,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              decoration: const BoxDecoration(
                color: AppColors.lightBlack,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 28.0,
                    ),
                  ),
                  const Text(
                    'Board settings',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: AppColors.mainTextColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.lightBlack,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Board Name',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: AppColors.greyTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: AppColors.greyTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Background',
                        style: TextStyle(
                          fontFamily: "Chivo",
                          color: AppColors.greyTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.0),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          const Icon(
                            Icons.unfold_more_outlined,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.lightBlack,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Archive',
                    style: TextStyle(
                        fontFamily: "Chivo",
                        color: AppColors.greyTextColor,
                        fontSize: 16.0),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.chevron_right_rounded,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.lightBlack,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Close Board',
                  style: TextStyle(
                    fontFamily: "Chivo",
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
