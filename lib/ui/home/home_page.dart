import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user_api/services/model/random_model.dart';
import 'package:random_user_api/services/provider/random_user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer<RandomProvider>(
            builder: (context, x, child) {
              return FutureBuilder(
            future: x.fetchRandomData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                Result data = snapshot.data!.results.first;

                return Center(
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          maxRadius: 70,
                          backgroundImage: NetworkImage(data.picture.large),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                              "${data.name.title} ${data.name.first} ${data.name.last}")
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("city: ${data.location.city}"),
                              Text("country:  ${data.location.country}"),
                              Text("postcode: ${data.location.postcode}"),
                              Text("state: ${data.location.state}"),
                              Text("street name:${data.location.street.name}"),
                              Text(
                                  "street number:${data.location.street.number}"),
                              Text(
                                  "Timezone: ${data.location.timezone.description}"),
                              Text("offsett:${data.location.timezone.offset}"),
                              Text("lat:${data.location.coordinates.latitude}"),
                              Text(
                                  "lon:${data.location.coordinates.longitude}"),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.email),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(data.email)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                              "username: ${data.login.username} |  password:${data.login.password}")
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.phone),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(data.phone)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person_2),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("Age: ${data.dob.age.toString()}")
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('No results found'));
              }
            },
          );
            },
          )
        ],
      ),
    );
  }
}
