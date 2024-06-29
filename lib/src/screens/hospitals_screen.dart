import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resq_me/Cubits/hospital_cubit.dart';
import 'package:resq_me/src/screens/drawer_screen.dart';

import '../../Models/Hospital_Model.dart';
import '../widgets/hospital_card.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({super.key});

  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSearchBarVisible = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HospitalStateCubit>().getHospitals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const TheDrawer(),
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearchBarVisible = !_isSearchBarVisible;
              });
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_isSearchBarVisible)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search hospitals...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _searchController.clear();
                      context.read<HospitalStateCubit>().searchHospitals('');
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                onSubmitted: (value) {
                  context.read<HospitalStateCubit>().searchHospitals(value);
                },
              ),
            ),
          Expanded(
            child: BlocBuilder<HospitalStateCubit, HospitalState>(
              builder: (context, state) {
                if (state is HospitalStateInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HospitalStateSuccess ||
                    state is HospitalStateFiltered) {
                  final hospitals = state is HospitalStateSuccess
                      ? state.hospitalModel
                      : (state as HospitalStateFiltered).filteredHospitalModel;

                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Hospital_Card(
                        padding: 8,
                        hospitalModel: hospitals[index],
                      );
                    },
                    itemCount: hospitals.length,
                  );
                } else {
                  return const Center(
                    child: Text(
                        'Oops, there was an unexpected error. Please try again later.'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
