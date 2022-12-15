import 'dart:collection';


// 알고리즘 놀이
// void main() {
//   // twoSum([2,7,11,15], 9);
//   final list = [6,1,2,7,8,5, 10];
//   // 6 1 2 5 8 7 10
//   // 6 1 2 5 7 8 10
//   quickSort(list, 0, 6);
//
//   print(list);
// }
// // [6,1,2,5,7,9,8]
// quickSort(List<int> list, int left, int right){
//   if(left >= right) return;
//
//   final pivotIndex = ((left + right) / 2).toInt();
//   final pivot = list[pivotIndex];
//
//   var start = left+1;
//   var end = right;
//
//   var tmp = list[left];
//   list[left] = pivot;
//   list[pivotIndex] = tmp;
//
//   while(start < end){
//
//     while(list[start] <= pivot) { start++; }
//     while(list[end] >= pivot && start< end) { end--; }
//
//     if(start < end){ //아직 만나거나 엇갈리지 않았다면
//       final tmp = list[start];
//       list[start] = list[end];
//       list[end] = tmp;
//     }else{
//       break;
//     }
//   }
//
//   tmp = list[end];
//   list[end] = pivot;
//   list[pivotIndex] = tmp;
//
//   quickSort(list, start, pivotIndex-1);
//   quickSort(list, pivotIndex+1, end);
// }
//
// List<int> twoSum(List<int> nums, int target) {
//   final hashMap = HashMap<int, int>();
//   final ans = <int>[];
//
//   for(var i = 0; i<nums.length; i++){
//     final remain = (nums[i] - target).abs();
//     print(remain);
//
//     if(hashMap.containsKey(remain)){
//       final res = hashMap.keys.firstWhere((element) => element == remain);
//       final keyIndex = nums.indexOf(res);
//       ans.add(keyIndex);
//       ans.add(i);
//
//       break;
//     }
//
//     hashMap.putIfAbsent(nums[i], () => remain);
//   }
//
//   print(hashMap.toString());
//   print(ans.toString());
//   return ans;
// }