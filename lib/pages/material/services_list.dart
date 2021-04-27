import 'package:yandra_app/components/centeredMessage.dart';
import 'package:yandra_app/components/service_card.dart';
import 'package:yandra_app/models/service.dart';
import 'package:yandra_app/repositories/service_repository.dart';
import 'package:flutter/material.dart';

class ServicesList extends StatefulWidget {
  @override
  _ServicesListState createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  final String _title = 'Serviços';
  List<Service> _services;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
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
      body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        onRefresh: () => _handleRefresh(),
        child: FutureBuilder<List<Service>>(
          future: ServiceRepository().getAll(),
          initialData: [],
          builder: (context, snapshot) {
            _services = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;

              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
                break;

              case ConnectionState.active:
                break;

              case ConnectionState.done:
                if (snapshot.hasData && _services != null) {
                  return ListView.builder(
                    itemCount: _services.length,
                    itemBuilder: (context, index) {
                      return ServiceCard(
                        service: _services[index],
                      );
                    },
                  );
                }

                if (!snapshot.hasError && _services == null)
                  return CenteredMessage(
                    snapshot.error.toString(),
                  );
                break;
            }

            return CenteredMessage(
              snapshot.error.toString(),
              icon: Icons.error_outline_sharp,
            );
          },
        ),
      ),
    );
  }

  Future<List<Service>> _handleRefresh() async {
    _services.clear();
    setState(() async => _services = await ServiceRepository().getAll());

    return _services;
  }
}
