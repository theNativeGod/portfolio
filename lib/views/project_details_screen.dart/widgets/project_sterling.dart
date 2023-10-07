import 'package:flutter/material.dart';
import 'headings.dart';
import 'links.dart';
import 'paragraph.dart';

class ProjectSterling extends StatelessWidget {
  const ProjectSterling({
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
          child: Image.asset('assets/images/sterlingDetails.png'),
        ),
        const Heading('Sterling'),
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
                    'The sterling app is a Taxi Booking App that was requested by a client, who works in Coca-Cola and Pepsi, to surprise his colleages and to make their everyday transportation easier. So Sterling is a Tours and Travels agency that provides various vehicle types such as Sedan, Wagon and Microcars, for various ride categories such as Full day ride, Airport ride, Half day ride, out station ride.',
              ),
              SizedBox(
                height: 16,
              ),
              Paragraph(
                heading: 'Description of the project',
                text:
                    'Customer\'s App:\n\nThis app is a simple taxi booking app that comes with a quick request form where users can enter their ride details such as date, time, pickup, destination, ride category, ride type, vehicle type and any additional notes.\n\nOnce the user books a ride, The ride details appear in the current requests section in the dashboard. The current request section changes from awating to confirmed as soon as a pilot(driver) is assigned to the customer.\n\nLatest four rides are shown in the ride history as well as payment history section in dashboard. All previous rides are shown in the Trip History section. \n\nPilot App: \n\nThe pilot app is integrated within the same app and opens up when the pilot\'s login credentials are entered in the login screen. Therefore, a person can be either a customer or a pilot at a time. The pilot can view their assigned customers(that is done from backend). The pilot app alsp has a history section where they can view the ride histories.\n\n',
              ),
              SizedBox(
                height: 16,
              ),
              Paragraph(
                heading: 'Technical Analysis of the Toya App',
                text:
                    'The app is made in Flutter and a PHP back-end. I was only responsible for the front-end of this app, so I will focus on describing the front-end part.\n\nFront-end: Flutter with Provider State Management, and MVVM architecture, was used in the front-end. The trip requests, dashboard data, history page data, as well as login data are fetched from backend.\n\nAuthentication: Firebase Phone OTP Authentication is used for authenticating the users.\n\nStorage: Firebase storage is used to store the user profile images.',
              ),
              SizedBox(height: 16),
              Links(
                playStoreLink:
                    'https://play.google.com/store/apps/details?id=com.sterling.taxi',
                appStoreLink:
                    'https://apps.apple.com/in/app/sterling-tours-and-travels-inc/id6456341851',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
