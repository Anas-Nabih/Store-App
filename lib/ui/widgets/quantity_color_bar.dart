import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/ui/product_details/product_details_provider.dart';
import 'package:store_app/ui/product_details/product_details_screen.dart';
import 'package:store_app/ui/widgets/count_button.dart';

class QuantityColorBar extends StatelessWidget {
  const QuantityColorBar({
    Key key,
    @required this.argument,
    @required this.provider,
  }) : super(key: key);

  final ProductDetailsArgument argument;
  final ProductDetailsProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 8.h,
      padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w),
      decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),

          )
      ),
      child: Row(
        children: [
          ...List.generate(
              argument.product.colors.length,
                  (index) => GestureDetector(
                onTap: () =>
                provider.selectedColor = index,
                child: Container(
                  height: 8.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: provider.selectedColor ==
                              index
                              ? kPrimaryColor
                              : Colors.transparent),
                      shape: BoxShape.circle),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 1.w, right: 1.w),
                      height: 5.h,
                      width: 7.w,
                      decoration: BoxDecoration(
                        color: argument
                            .product.colors[index],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              )),
          Spacer(),
          CountButton(
            iconData: Icons.remove,
            provider: provider,
            onPressed: () {
              if (provider.qty > 1) {
                provider.decreaseQTY();
              }
            },
          ),
          SizedBox(
            width: 3.w,
          ),
          Text(
            "${provider.qty}",
            style: TextStyle(
                color: Colors.black, fontSize: 12.sp),
          ),
          SizedBox(
            width: 3.w,
          ),
          CountButton(
            iconData: Icons.add,
            provider: provider,
            onPressed: () => provider.increaseQTY(),
          ),
        ],
      ),
    );
  }
}