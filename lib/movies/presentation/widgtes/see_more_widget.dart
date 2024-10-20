import 'package:flutter/material.dart';
import 'package:movie/core/utility/app_string.dart';

class SeeMoreWidget extends StatelessWidget {
  final String nameOfSee;
  final void Function()? onTapOnSeeMore;
  const SeeMoreWidget(
      {super.key, required this.nameOfSee, this.onTapOnSeeMore});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nameOfSee,
          ),
          InkWell(
            onTap: onTapOnSeeMore,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    AppString.seeMore,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
