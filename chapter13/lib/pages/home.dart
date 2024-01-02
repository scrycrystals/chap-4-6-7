// Import necessary packages and classes at the beginning of the file
import 'package:flutter/material.dart';
import 'package:chapter13/pages/edit_entery.dart';
import 'package:chapter13/pages/database.dart';
import 'package:intl/intl.dart';

// home.dart

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Database _database;

  @override
  void initState() {
    super.initState();
   Database myDatabase = Database(journal: /* provide a List<Journal> here */); // Initialize your database object
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal App'),
      ),
      body: FutureBuilder(
        initialData: [],
        future: _loadJournals(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : _buildListViewSeparated(snapshot);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(padding: const EdgeInsets.all(24.0)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Journal Entry',
        child: Icon(Icons.add),
        onPressed: () {
          _addOrEditJournal(add: true, index: -1, journal: Journal());
        },
      ),
    );
  }

  Future<List<Journal>> _loadJournals() async {
    // Placeholder implementation to load journals from the database
    return [];
  }

  Widget _buildListViewSeparated(AsyncSnapshot snapshot) {
    return ListView.separated(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        String _titleDate = DateFormat.yMMMd().format(DateTime.parse(snapshot.data[index].date));
        String _subtitle = snapshot.data[index].mood + "\n" + snapshot.data[index].note;

        return Dismissible(
          key: Key(snapshot.data[index].id),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: ListTile(
            leading: Column(
              children: <Widget>[
                Text(
                  DateFormat.d().format(DateTime.parse(snapshot.data[index].date)),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  DateFormat.E().format(DateTime.parse(snapshot.data[index].date)),
                ),
              ],
            ),
            title: Text(
              _titleDate,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(_subtitle),
            onTap: () {
              _addOrEditJournal(
                add: false,
                index: index,
                journal: snapshot.data[index],
              );
            },
          ),
          onDismissed: (direction) {
            setState(() {
              _database.journal.removeAt(index);
            });
            DatabaseFileRoutines().writeJournals(databaseToJson(_database));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
        );
      },
    );
  }

  void _addOrEditJournal({required bool add, required int index, required Journal journal}) {
    // Placeholder implementation for adding or editing journal entries
  }
}

class Journal {
  // Placeholder class for journal entry
  String id = "";
  String date = "";
  String mood = "";
  String note = "";

  Journal({this.id = "", this.date = "", this.mood = "", this.note = ""});
}
