import 'package:dsplatform/features/organization/bloc/organization/organization_bloc.dart';
import 'package:dsplatform/features/organization/domain/repositories/organization_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrganizationSelectPage extends StatefulWidget {
  const OrganizationSelectPage({Key? key}) : super(key: key);

  @override
  State<OrganizationSelectPage> createState() => _OrganizationSelectPageState();
}

class _OrganizationSelectPageState extends State<OrganizationSelectPage> {

  final OrganizationBloc _organizationBloc = OrganizationBloc(
      organizationRepository: IOrganizationRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _organizationBloc..add(OrganizationLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.select_organization),
        ),
        body: BlocBuilder<OrganizationBloc, OrganizationState>(
          builder: (context, state) {
            if(state is OrganizationLoadedState) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView.builder(
                  itemCount: state.organizations.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                      child: ListTile(
                        title: Text(state.organizations[index].getNameByLocalization(AppLocalizations.of(context)!.language_code)),
                        subtitle: Text("БИН: ${state.organizations[index].bin}"),
                        tileColor: Colors.white,
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Theme.of(context).primaryColor,
                        ),
                        onTap: () {

                        },
                      ),
                    );
                  }
                ),
              );
            }
            return const SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator())
            );

          },
        ),
      ),
    );
  }
}
