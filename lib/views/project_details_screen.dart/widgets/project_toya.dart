import 'package:flutter/material.dart';

import 'headings.dart';
import 'links.dart';
import 'paragraph.dart';

class ProjectToya extends StatelessWidget {
  const ProjectToya({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Image.asset('assets/images/toyaDetails.png'),
        ),
        const Heading('Toya'),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Paragraph(
                heading: 'Overview',
                text:
                    'Toya is a Private Members Club App based in London. This is by far one of my favorite projects. I enjoyed as well as learned a lot while the making of this project. The purpose of this app was to form a social community for the highly smart and successful people in London. It took a total of 2 weeks to design and 3 weeks to develop the entire project.',
              ),
              SizedBox(
                height: 16,
              ),
              Paragraph(
                heading: 'What is a Private Members Club?',
                text:
                    'A private members club is a place for the elite, accomplished and leaders to connect with each other in an exclusive, luxurious space.\n\nToya takes a fresh outlook towards private members clubs by becoming London’s first inclusive-exclusive members club. It is inclusive in the sense that anyone from any background can apply for membership because membership fees start at £10/month: staggeringly lower than other members clubs with memberships starting at £2,000 annually. Therefore, the club is making luxury and elite connections accessible to groups who would’ve been unable to do so in the past: queer, trans, etc. being some of those groups.\n\nBut Toya is exclusive in the sense that only leaders, innovators and visionaries are accepted. Toya is also London’s first members club to provide matchmaking features, bringing to the city an innovative way to meet potential partners. Finally, the club does exclusive events at some of the finest luxury spaces of London. Toya is changing the private members club scene for the better with diversity, innovation and luxury at its core.',
              ),
              SizedBox(
                height: 16,
              ),
              Paragraph(
                heading: 'Description of the project',
                text:
                    'So, now that we know what is a private members club, the Toya app does just that. Its basically a social app that shows events, a connections section where we can explore different people in the feed as well as send and receive connection requests. Then there is a chats section where we can chat with our connections. A personal profile section where we can manage our profile with different subsections such as bio, photos, prompts, etc. Finally there is the Bespoke section which is only available to explorer and connoisseur tier members.',
              ),
              SizedBox(
                height: 16,
              ),
              Paragraph(
                heading: 'Bespoke Dating',
                text:
                    'So this is the most interesting part of the app. Here the members of the app need to answer a list of multichoice questions. These questions are curated and designed to find you a perfect match. At the end they get to add any additional notes and then they just need to click on the submit button.\n\nThe Toya team then finds the members relevant matches and select a venue where both the people agree on. The matches appear on the My Date tab in the Bespoke section.',
              ),
              SizedBox(
                height: 16,
              ),
              Paragraph(
                heading: 'Where do I play a role in this?',
                text:
                    'Yeah, so I created the entire app from scratch. The design was made in Figma in the first two weeks. Then the development was done in Flutter and Firebase for the rest of the three weeks.',
              ),
              SizedBox(
                height: 16,
              ),
              Paragraph(
                heading: 'Technical Analysis of the Toya App',
                text:
                    'Design: The app was designed to give it a fun, lovely but elegant look to it.\n⦁	Wireframes -> The wireframes of the app mainly consist of rounded rectangles and a few circle avatars for profile images.\n⦁	Spacing -> The entire app is evenly spaced with a primary spacing of 16 pixels and other multiples of 4.\n⦁	Color -> The coloring of the app is done with linear horizontal gradients as such to give the entire app a pastel effect. White text over contrasting colors is used to make it look stylish.\n\nFront-end: The front-end of the app is made in Flutter. Agile development methodology along with Clean Architecture is used in this project.\nArchitecture: The app follows Models-Views-View-Models (MVVM) folder structure. The API calls as well as constants such as themes are in seperate folders.\nState Management: Provider state management, which goes exceptionally well with MVVM, is used in this entire project. The classes with ChangeNotifier mixin is put in the view-model folders. These providers are created at the begining of material app inside the MultiProvider widget.\n\nBack-end: The back-end of the app is made in Firebase. The main data is stored in Cloud Firestore whereas the photo files are stored in Storage.\n\nAuthentication: For authentication, The app uses Firebase Phone Authentication where the user is verified via OTP.\n\nIn App Subscriptions: The app has three entitlements: free, explorer and connoisseur\nThe free tier users get little to no access to the features of the app. It is suitable for the newcomers to have a look at the app.\nThe Explorer has most features of the app unlocked and is the most recommended one. It is further divided into one-month, three-month and one-year plans.\nThe Connoisseur is the most premium tier membership offered by the app. It is also further divided into one-month, three-month and one-year plans.\nThe In App Subscriptions in AppStore and PlayStore is implemented and managed through a 3rd party service called RevenueCat.\n',
              ),
              SizedBox(height: 16),
              Links(
                playStoreLink:
                    'https://play.google.com/store/apps/details?id=com.toya.som',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
