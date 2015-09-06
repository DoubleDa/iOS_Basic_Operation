#Swift中74个内置函数介绍:

**(无需任何引入模块 eg:Foundation)**

***

> filter(满足某种条件的元素),map(将每个元素进行转换),reduce(将数组元素组合计算为一个值)

 1. assert(true) // 断言，若true继续 
 2. abs(-1)	// 绝对值
 3.	contains(sequence,element) // 给定序列(Array,Dictionary)包含特定元素返回 true
 4. dropFirst(sequence) //  返回去掉第一个元素的新序列
 5. dropLast(sequence)	// 返回去掉最后一个元素
 6. dump(object) 	// 一个对象的内容转存到标准输出
 7. //equal(sequence1,sequence2)	// 若序列1，序列2包含相同的元素，返回true
 8. filter
 9. a.indexOf(element)   //代替了find(sequence,element)，给定的序列中返回指定索引，没有元素返回nil; find(sequence,"Swift") == 1
 10. //indices(sequence)	// 在制定的序列中返回元素的索引(零索引)
 11. join(separator,sequence)	// 返回一个由给定的分隔符分离出来的序列元素
 12. max(sequence1,sequence2,etc.)
 13. maxElement(sequence)
 14. minElement(sequence)
 15. reduce(sequence,inital,combineClosure)		// 
 16. reverse(sequence)	// 返回序列的倒序
 17. startsWith(sequence1,sequence2)	// 起始元素相等 返回true