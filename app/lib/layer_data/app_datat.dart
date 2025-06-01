// lib/layer_data/app_datat.dart
import 'dart:developer';
import 'package:app/model/task/task.dart'; // تأكد من المسار الصحيح
import 'package:app/repo/supabase.dart'; // تأكد من المسار الصحيح

class AppDatatLayer {
  // دالة لإضافة مهمة جديدة
  Future<void> addTask(Task task) async {
    try {
      final user = SupabaseConnect.supabase!.auth.currentUser;
      if (user == null) {
        throw Exception("User not logged in. Cannot add task.");
      }

      final taskMap = task.toMap(includeId: false);
      taskMap['user_id'] = user.id;

      final response = await SupabaseConnect.supabase!
          .from('tasks') // اسم الجدول الذي أنشأناه في Supabase
          .insert(taskMap)
          .select(); // استخدام select() لجلب البيانات بعد الإدراج إذا لزم الأمر

      log('AppDatatLayer: Task added successfully: $response');
    } catch (e) {
      log('AppDatatLayer: Error adding task to Supabase: $e');
      throw Exception('Failed to add task: $e');
    }
  }

  //load tasks
 Future<List<Task>> fetchTasks() async {
    try {
      log("AppDatatLayer: بدأ محاولة جلب المهام.");
      final user = SupabaseConnect.supabase!.auth.currentUser;
      if (user == null) {
        log("AppDatatLayer: المستخدم غير مسجل دخول. لا يمكن جلب المهام.");
        throw Exception("User not logged in. Cannot fetch tasks.");
      }
      log("AppDatatLayer: المستخدم مسجل دخول، ID: ${user.id}");

      final response = await SupabaseConnect.supabase!
          .from('tasks')
          .select()
          .eq('user_id', user.id)
          .order('created_at', ascending: false);
      
      log("AppDatatLayer: تم استلام استجابة من Supabase لجدول المهام."); 

      // **التعديل الضروري هنا:**
      // إذا كانت الاستجابة فارغة أو null، أرجعي قائمة فارغة.
      if (response == null || response.isEmpty) {
        log("AppDatatLayer: الاستجابة فارغة. لا توجد مهام لهذا المستخدم.");
        return []; // **هذا هو السطر الذي يجب أن يتغير!**
      }

      final List<dynamic> data = response;
      log("AppDatatLayer: بدأ تحويل ${data.length} عنصر بيانات إلى كائنات Task.");

      return data.map((e) => Task.fromMap(e)).toList();
    } catch (e) {
      log("AppDatatLayer: **خطأ فادح في جلب المهام:** $e");
      throw Exception('Error fetching tasks: $e'); 
    }
  }

  /** // دالة لجلب المهام للمستخدم الحالي (مثال)
  Stream<List<Task>> getTasksStream() {
    final user = SupabaseConnect.supabase!.auth.currentUser;
    if (user == null) {
      log('AppDatatLayer: No user logged in, returning empty task stream.');
      return Stream.value([]); // إرجاع Stream فارغ إذا لم يكن هناك مستخدم
    }

    return SupabaseConnect.supabase!
        .from('tasks')
        .stream(primaryKey: ['id']) // استخدام stream مع المفتاح الأساسي
        .eq('user_id', user.id) // جلب المهام الخاصة بالمستخدم الحالي فقط
        .order('created_at', ascending: false) // ترتيب المهام
        .map((maps) => maps.map((map) => Task.fromMap(map)).toList());
  }
 */
  // دالة لتحديث حالة اكتمال المهمة
  Future<void> updateTaskCompletion(String taskId, bool isCompleted) async {
    try {
      final user = SupabaseConnect.supabase!.auth.currentUser;
      if (user == null) {
        throw Exception("User not logged in. Cannot update task.");
      }

      await SupabaseConnect.supabase!
          .from('tasks')
          .update({'is_completed': isCompleted})
          .eq('id', taskId)
          .eq('user_id', user.id); // التأكد من أن المستخدم يحدث مهمته الخاصة
      log('AppDatatLayer: Task $taskId completion updated to $isCompleted');
    } catch (e) {
      log('AppDatatLayer: Error updating task completion: $e');
      throw Exception('Failed to update task completion: $e');
    }
  }

  // دالة لحذف مهمة
  Future<void> deleteTask(String taskId) async {
    try {
      final user = SupabaseConnect.supabase!.auth.currentUser;
      if (user == null) {
        throw Exception("User not logged in. Cannot delete task.");
      }
      await SupabaseConnect.supabase!
          .from('tasks')
          .delete()
          .eq('id', taskId)
          .eq('user_id', user.id); // التأكد من أن المستخدم يحذف مهمته الخاصة
      log('AppDatatLayer: Task $taskId deleted.');
    } catch (e) {
      log('AppDatatLayer: Error deleting task: $e');
      throw Exception('Failed to delete task: $e');
    }
  }
}
