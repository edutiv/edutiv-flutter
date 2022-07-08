import 'package:edutiv/api/course_api.dart';
import 'package:edutiv/model/course/course_model.dart';
import 'package:edutiv/model/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SuccessCourseScreen extends StatefulWidget {
  const SuccessCourseScreen({Key? key}) : super(key: key);

  @override
  State<SuccessCourseScreen> createState() => _SuccessCourseScreenState();
}

class _SuccessCourseScreenState extends State<SuccessCourseScreen> {
  int ratingValue = 0;
  TextEditingController reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as CourseModel;
    final user = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Lottie.asset('assets/success.json'),
                backgroundColor: Colors.transparent,
                radius: 150,
              ),
              const SizedBox(height: 16),
              const Text('What a Day!'),
              const SizedBox(height: 8),
              Text(
                'Finally you have completed the ${data.courseName} course very well.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('DOWNLOAD CERTIFICATE')),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return SimpleDialog(
                              titlePadding:
                                  const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Rating a Course',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        Navigator.pop(dialogContext),
                                    icon: const Icon(Icons.close_outlined),
                                  )
                                ],
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(data.courseName!),
                                ),
                                RatingBar.builder(
                                  initialRating: 1,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                    vertical: 2,
                                  ),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    setState(() {
                                      ratingValue = rating.toInt();
                                    });
                                  },
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: reviewController,
                                  decoration: const InputDecoration(
                                    hintText: 'Write review...',
                                    border: OutlineInputBorder(),
                                  ),
                                  minLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    CourseAPI().createReview(
                                      data.id!,
                                      user.userData.id!,
                                      ratingValue,
                                      reviewController.text,
                                    );
                                    Navigator.pushReplacementNamed(
                                        context, '/mainpage');
                                  },
                                  child: const Text('SUBMIT'),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('RATING COURSE'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
