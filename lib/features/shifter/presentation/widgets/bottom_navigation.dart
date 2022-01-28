
import 'package:flutter/material.dart';
import 'package:shifter/features/shifter/presentation/pages/candidateactivity/candidate_page.dart';
import 'package:shifter/features/shifter/presentation/pages/homepage/userhomepage.dart';
import 'package:shifter/features/shifter/presentation/pages/interviewactivity/interview_page.dart';
import 'package:shifter/features/shifter/presentation/pages/jobactivity/job_page.dart';
import 'package:shifter/features/shifter/presentation/pages/profileactivity/profile_page.dart';


class NavScreen extends StatefulWidget {
  static const String Tag = "-/navscreen";
  const NavScreen({ Key? key,  this.title,  this.id}): super(key: key);
  //update the constructor to include the uid
  final String? id, title; //include this

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;
  final _screens = [
   const UserHomePage(),
    const CandidatePage(),
    const InterviewPage(),
    const JobPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: _screens.asMap().map(
              (i, screen) => MapEntry(
            i,
            Offstage(
                offstage: _selectedIndex != i,
                child: screen),
          ),
        ).values.toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.amber.shade700,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex =i),
        items:  [
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/myicons/dashboard.png", height: 26,),
            activeIcon: Image.asset("assets/images/myicons/dashboard_active.png", height: 26,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/myicons/candidate.png", height: 26,),
            activeIcon: Image.asset("assets/images/myicons/candidate_active.png", height: 26,),
            label: 'Candidates',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/myicons/interview.png", height: 26,),
            activeIcon: Image.asset("assets/images/myicons/interview_active.png", height: 26,),
            label: 'Interviews',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/myicons/job.png", height: 26,),
            activeIcon: Image.asset("assets/images/myicons/job_active.png", height: 26,),
            label: 'Jobs',

          ),
          BottomNavigationBarItem(
            icon:Image.asset("assets/images/myicons/account.png", height: 30,),
            activeIcon: Image.asset("assets/images/myicons/account_active.png", height: 30,),
            label: 'Profile',

          ),
        ],
      ),
    );
  }
}