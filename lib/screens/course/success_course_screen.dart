import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';

class SuccessCourseScreen extends StatefulWidget {
  const SuccessCourseScreen({Key? key}) : super(key: key);

  @override
  State<SuccessCourseScreen> createState() => _SuccessCourseScreenState();
}

class _SuccessCourseScreenState extends State<SuccessCourseScreen> {
  @override
  Widget build(BuildContext context) {
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
                // backgroundImage: AssetImage('assets/success.png'),
                radius: 150,
              ),
              const SizedBox(height: 16),
              const Text('What a Day!'),
              const SizedBox(height: 8),
              const Text(
                'Finally you have completed the Introduction to UI/UX Designer course very well.',
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
                            builder: (context) {
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
                                        onPressed: () {},
                                        icon: const Icon(Icons.close_outlined))
                                  ],
                                ),
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child:
                                        Text('Introduction to UI/UX Designer'),
                                  ),
                                  RatingBar.builder(
                                    initialRating: 2,
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
                                      print(rating);
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Write review...',
                                      border: OutlineInputBorder(),
                                    ),
                                    minLines: 5,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                  ),
                                  ElevatedButton(
                                      onPressed: () =>
                                          Navigator.pushReplacementNamed(
                                              context, '/mainpage'),
                                      child: const Text('SUBMIT'))
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('RATING COURSE')),
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
