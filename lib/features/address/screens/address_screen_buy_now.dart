import 'package:shopease/constants/utils.dart';
import 'package:shopease/features/address/services/address_services.dart';
import 'package:shopease/features/cart/widgets/custom_text_button.dart';
import 'package:shopease/models/product.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';

class AddressScreenBuyNow extends StatefulWidget {
  static const String routeName = '/address-screen-buy-now';
  final Product product;

  const AddressScreenBuyNow({super.key, required this.product});

  @override
  State<AddressScreenBuyNow> createState() => _AddressScreenBuyNowState();
}

class _AddressScreenBuyNowState extends State<AddressScreenBuyNow> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  String addressToBeUsed = '';

  List<PaymentItem> paymentItems = [];

  final Future<PaymentConfiguration> _googlePayConfigFuture =
      PaymentConfiguration.fromAsset('gpay.json');

  final AddressServices addressServices = AddressServices();

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  @override
  void initState() {
    super.initState();
    paymentItems.add(PaymentItem(
        amount: widget.product.price.toString(),
        label: 'Total Amount',
        status: PaymentItemStatus.final_price));
  }

  void onPaymentResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
    }
    addressServices.placeOrderBuyNow(
        context: context, product: widget.product, address: addressToBeUsed);
  }

  void payPressed(String addressFromProvider) {
    addressToBeUsed = '';
    bool isFromForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (isFromForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController.text}, ${areaController.text}, ${cityController.text}, ${pincodeController.text}';
      } else {
        throw Exception('Please enter all the values');
      }
    } else if (addressToBeUsed.isEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'ERROR');
    }
  }

  void _showConfirmationModal(String address) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Confirmation of Cash on Delivery',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Payment will be made on delivery to the following address:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                address,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextButton(
                buttonText: 'Confirm',
                onPressed: () {
                  onPaymentResult(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'SubTotal ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87),
                  ),
                  const Text(
                    'Php ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    formatPriceWithDecimal(widget.product.price),
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextfield(
                      controller: flatBuildingController,
                      hintText: 'Flat, house no, building',
                    ),
                    CustomTextfield(
                      controller: areaController,
                      hintText: 'Area, street',
                    ),
                    CustomTextfield(
                      controller: pincodeController,
                      hintText: 'Pincode',
                    ),
                    CustomTextfield(
                      controller: cityController,
                      hintText: 'Town/city',
                    ),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cash on Delivery Button
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Display modal on Cash on Delivery button press
                          payPressed(address);
                          _showConfirmationModal(addressToBeUsed);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 146, 132, 227),
                        ),
                        child: const Text(
                          'Cash on Delivery',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    // OR Text Widget
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    // Google Pay Button
                    FutureBuilder<PaymentConfiguration>(
                      future: _googlePayConfigFuture,
                      builder: (context, snapshot) => snapshot.hasData
                          ? GooglePayButton(
                              onPressed: () => payPressed(address),
                              width: double.infinity,
                              height: 50,
                              paymentConfiguration: snapshot.data!,
                              paymentItems: paymentItems,
                              type: GooglePayButtonType.buy,
                              margin: const EdgeInsets.only(top: 15.0),
                              onPaymentResult: onPaymentResult,
                              loadingIndicator: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
