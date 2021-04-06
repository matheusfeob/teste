import 'package:yandra_app/components/service_card.dart';
import 'package:yandra_app/models/service.dart';
import 'package:yandra_app/repositories/service_repository.dart';
import 'package:flutter/material.dart';

class ServicesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviços'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
            ),
          )
        ],
      ),
      drawer: Drawer(),
      body: Center(
        child: FutureBuilder<List<Service>>(
          future: ServiceRepository().getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ServiceCard(
                    service: snapshot.data[index],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
