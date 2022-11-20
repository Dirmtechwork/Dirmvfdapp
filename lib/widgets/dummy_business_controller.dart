import 'package:get/get.dart';

import '../models/owner_business.dart';

class OwnBusinessController extends GetxController {
  var owners = <Owner>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchOwners();
  }

  void fetchOwners() async {
    await Future.delayed(Duration(seconds: 1));
    var ownerResult = [
      Owner(
        imagePath:
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.unsplash.com%2Fphoto-1453728013993-6d66e9c9123a%3Fixlib%3Drb-1.2.1%26ixid%3DMnwxMjA3fDB8MHxzZWFyY2h8NHx8dmlzaW9ufGVufDB8fDB8fA%253D%253D%26w%3D1000%26q%3D80&imgrefurl=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fvision&tbnid=n5hAWsQ-sgKo_M&vet=12ahUKEwjGtOa98Kz5AhUr5IUKHROAB4YQMygBegUIARC6AQ..i&docid=gDEFXggqFdOZlM&w=1000&h=667&q=image&client=firefox-b-d&ved=2ahUKEwjGtOa98Kz5AhUr5IUKHROAB4YQMygBegUIARC6AQ',
        businessname: 'DIRMGROUP,',
        location: 'TEVI COMMERCIAL PARK-MBEZI BEACH,',
        address: 'P.O.BOX35880,',
        region: 'DAR ES SALAAM TANZANIA,',
        contact: '0788809966',
      ),
    ];
    owners.value = ownerResult;
  }
}
