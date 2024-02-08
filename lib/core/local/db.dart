import 'package:gp/models/apply_job_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDataBase {
  Future<Database> openDB() async {
    String path = await getDatabasesPath();
    Database myDB = await openDatabase(join(path, "myData.db"), version: 1,
        onCreate: (db, version) {
      db.execute('CREATE TABLE RecentSearches(recent TEXT )');
      db.execute('CREATE TABLE RecentJobs(id INTEGER)');
      db.execute(
          'CREATE TABLE ApplyJob(jobId INTEGER,step INTEGER,fullName TEXT,email TEXT,handphone TEXT,typeOfWork TEXT,CV TEXT,otherFile TEXT)');
      db.execute(
          'CREATE TABLE Education(university TEXT,title TEXT,start INTEGER,end INTEGER)');
    });

    return myDB;
  }

  Future<bool> insertEducation({required Map<String, dynamic> map}) async {
    Database myDb = await openDB();
    myDb.insert('Education', map);
    return true;
  }

  Future<List<Map<String, dynamic>>> getAllEducation() async {
    Database myDb = await openDB();

    List<Map<String, dynamic>> data = await myDb.query('Education');

    return data;
  }

  Future<bool> insertRecentJobs({required int id}) async {
    List<int> recentJobs = await getRecentJobs();
    if (!recentJobs.contains(id)) {
      Database myDb = await openDB();
      myDb.insert('RecentJobs', {"id": id});
      return true;
    }
    return false;
  }

  Future<List<int>> getRecentJobs() async {
    Database myDb = await openDB();

    List<Map<String, dynamic>> data = await myDb.query('RecentJobs');
    List<int> recentJobs = [];

    for (var singleMap in data) {
      recentJobs.add(singleMap['id']);
    }
    return recentJobs;
  }

  Future<List<String>> getRecentSearches() async {
    Database myDb = await openDB();

    List<Map<String, dynamic>> data = await myDb.query('RecentSearches');
    List<String> recentJobsSearches = [];

    for (var singleMap in data) {
      recentJobsSearches.add(singleMap['recent']);
    }
    return recentJobsSearches;
  }

  Future<void> deleteRecentSearcheJob({required String recent}) async {
    Database myDb = await openDB();
    await myDb
        .delete("RecentSearches", where: "recent = ?", whereArgs: [recent]);
  }

  Future<bool> insertRecentSearcheJob({required String recent}) async {
    List<String> recentJobsSearches = await getRecentSearches();
    if (!recentJobsSearches.contains(recent)) {
      Database myDb = await openDB();
      await myDb.insert('RecentSearches', {"recent": recent});
      return true;
    }
    return false;
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<void> deleteApplyJob({required int jobId}) async {
    Database myDb = await openDB();
    await myDb.delete("ApplyJob", where: "jobId = ?", whereArgs: [jobId]);
  }

  Future<List<ApplyJobModel>> getApplyJob() async {
    Database myDb = await openDB();

    List<Map<String, dynamic>> data = await myDb.query('ApplyJob');
    List<ApplyJobModel> applyJob = [];

    for (var singleMap in data) {
      applyJob.add(ApplyJobModel.fromDB(singleMap));
    }
    return applyJob;
  }

  Future<void> upDateApplyJob(
      {required int jobId, required ApplyJobModel newApply}) async {
    Database myDb = await openDB();
    await myDb.update("ApplyJob", newApply.toMap(),
        where: "jobId = ?", whereArgs: [jobId]);
  }

  Future<bool> insertApplyJob({required ApplyJobModel newApply}) async {
    Database myDb = await openDB();
    List<ApplyJobModel> applyJob = await getApplyJob();
    for (ApplyJobModel applyJobModel in applyJob) {
      if (applyJobModel.jobId == newApply.jobId) {
        await upDateApplyJob(jobId: newApply.jobId!, newApply: newApply);
        return true;
      }
    }
    await myDb.insert('ApplyJob', newApply.toMap());
    return true;
  }

  Future<void> clear() async {
    Database myDb = await openDB();
    myDb.delete('RecentSearches');
    myDb.delete('RecentJobs');
    myDb.delete('ApplyJob');
    myDb.delete('Education');
  }
}
