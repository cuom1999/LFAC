# Hang động ★★★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Jakub Łącki  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `jas`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2014/jas>

## Đề bài

Một nhóm các nhà thám hiểm hang động đang lên kế hoạch khảo sát một hang động mới được phát hiện. Hang động gồm \(n\) căn phòng, được đánh số từ \(1\) đến \(n\). Các căn phòng được nối với nhau bằng \(n-1\) hành lang sao cho từ bất kỳ phòng nào cũng có thể đi tới bất kỳ phòng nào khác. Mỗi hành lang nối đúng hai căn phòng.

Nhóm khảo sát gồm \(m\) nhà thám hiểm, được đánh số từ \(1\) đến \(m\). Mỗi người đưa ra yêu cầu về khu vực hang động mà mình muốn khảo sát. Nhà thám hiểm \(i\) muốn bắt đầu tại phòng \(a_i\), kết thúc tại phòng \(b_i\), và trên đường đi qua nhiều nhất \(d_i\) hành lang. Mỗi lần đi qua một hành lang đều được tính, kể cả khi đó là hành lang đã đi qua trước đó.

Byteasar, trưởng đoàn thám hiểm, muốn tại một thời điểm nào đó tất cả các nhà nghiên cứu có thể gặp nhau để trao đổi những gì họ quan sát được. Vì vậy, anh muốn biết liệu có thể chọn một căn phòng và lập lộ trình cho mọi nhà thám hiểm sao cho tất cả các lộ trình đều đi qua căn phòng đã chọn hay không. Dĩ nhiên, mỗi lộ trình vẫn phải thỏa mãn những yêu cầu ban đầu của người thực hiện nó.

### Dữ liệu vào

Dòng đầu chứa một số nguyên \(t\)

\[
1\le t\le 1000,
\]

là số bộ test. Tiếp theo là mô tả của từng bộ test.

Mỗi bộ test bắt đầu bằng một dòng chứa hai số nguyên \(n,m\)

\[
2\le n,\qquad m\le 300\,000,
\]

lần lượt là số căn phòng và số nhà thám hiểm.

\(n-1\) dòng tiếp theo mô tả các hành lang. Mỗi dòng chứa hai số nguyên \(u_i,w_i\)

\[
1\le u_i,w_i\le n,
\]

cho biết phòng \(u_i\) và phòng \(w_i\) được nối trực tiếp bằng một hành lang.

\(m\) dòng tiếp theo mô tả yêu cầu của các nhà thám hiểm. Dòng thứ \(i\) chứa ba số nguyên \(a_i,b_i,d_i\)

\[
1\le a_i,b_i\le n,
\qquad
1\le d_i\le 600\,000.
\]

Nhà thám hiểm \(i\) bắt đầu tại phòng \(a_i\), kết thúc tại phòng \(b_i\), và đi qua hành lang nhiều nhất \(d_i\) lần. Dữ liệu bảo đảm luôn tồn tại một cách đi từ \(a_i\) đến \(b_i\) qua không quá \(d_i\) hành lang.

Tổng các giá trị \(n\) trên mọi bộ test không vượt quá \(300\,000\); tổng các giá trị \(m\) cũng không vượt quá \(300\,000\).

### Dữ liệu ra

In đúng \(t\) dòng, mỗi dòng là đáp án cho một bộ test.

Nếu có thể lập lộ trình sao cho tất cả các nhà thám hiểm đều đi qua cùng một căn phòng, in `TAK`, rồi in số hiệu của một căn phòng có thể dùng làm nơi gặp mặt. Nếu không thể, chỉ in `NIE`.

Nếu có nhiều đáp án đúng, có thể in ra bất kỳ đáp án nào.

### Ví dụ

**Dữ liệu vào**

```text
2
5 3
1 2
2 3
2 4
3 5
1 4 2
5 5 5
3 2 1
3 2
1 2
2 3
1 1 2
3 3 1
```

**Dữ liệu ra**

```text
TAK 2
NIE
```

## Lời giải

Trước hết, ta đưa vào một số ký hiệu. Gọi \(d(u,w)\) là khoảng cách giữa hai phòng \(u,w\), tức số hành lang trên đường đi ngắn nhất giữa chúng.

Mỗi nhà thám hiểm được mô tả bởi bộ ba \(a_i,b_i,d_i\): người đó đi từ \(a_i\) đến \(b_i\) và được phép đi qua nhiều nhất \(d_i\) hành lang. Vì vậy, người này có thể ghé thăm phòng \(x\) khi và chỉ khi

\[
d(a_i,x)+d(x,b_i)\le d_i. \tag{1}
\]

Ta gọi tập các phòng mà nhà thám hiểm \(i\) có thể ghé thăm là **miền \(i\)**.

Nói theo ngôn ngữ lý thuyết đồ thị, dữ liệu cho một cây \(n\) đỉnh — sơ đồ hang động — cùng mô tả của \(m\) miền. Ta cần kiểm tra xem giao của tất cả các miền có chứa đỉnh nào hay không; nếu có, phải đưa ra một đỉnh như vậy.

### Lời giải đơn giản

Trước tiên, có thể xây dựng một lời giải \(O(n(n+m))\). Ta tính khoảng cách giữa mọi cặp đỉnh trong \(O(n^2\). Với mỗi trong \(m\) miền, duyệt qua mọi đỉnh và dùng công thức (1) để liệt kê các đỉnh thuộc miền đó trong \(O(n)\). Cuối cùng, với mỗi đỉnh, đếm số miền chứa nó để lấy giao của tất cả các miền.

Lời giải này khá đơn giản, nhưng hiển nhiên chưa đủ nhanh.

## Chia để trị

Lời giải tốt hơn đầu tiên sử dụng kỹ thuật chia để trị. Kỹ thuật này thường được áp dụng cho mảng: thực hiện lượng công việc tỉ lệ với kích thước mảng, chia mảng thành hai nửa, rồi giải đệ quy từng nửa. Để làm điều tương tự trên cây, ta cần biết cách chia cây thành những phần tương đối cân bằng.

**Bổ đề 1.** Cho cây \(T\) có \(n\) đỉnh. Trong thời gian \(O(n)\), ta có thể tìm một đỉnh \(v\) sao cho sau khi xóa \(v\), mọi cây thành phần còn lại đều có không quá \(n/2\) đỉnh. Đỉnh \(v\) như vậy được gọi là một **trọng tâm** của cây.

**Chứng minh.** Gốc hóa \(T\) tại một đỉnh tùy ý, rồi tính kích thước cây con gốc tại mỗi đỉnh. Bước này tốn \(O(n)\).

Bắt đầu ở gốc. Chừng nào một cây con gốc tại con của đỉnh hiện tại còn có nhiều hơn \(n/2\) đỉnh, ta chuyển xuống người con đó. Vì chỉ đi xuống cây nên quá trình sẽ dừng tại một đỉnh \(v\).

Cây con gốc tại \(v\) có nhiều hơn \(n/2\) đỉnh: ta bắt đầu tại gốc và chỉ chuyển vào một cây con có tính chất này. Nếu \(v\) không phải gốc, sau khi xóa \(v\), thành phần chứa cha của \(v\) có kích thước nhỏ hơn \(n/2\), bởi cây con gốc tại \(v\) có kích thước lớn hơn \(n/2\). Mặt khác, mọi cây con gốc tại một người con của \(v\) có không quá \(n/2\) đỉnh; nếu không, cuộc đi xuống chưa thể dừng tại \(v\). Do đó \(v\) là một trọng tâm. \(□\)

Ý tưởng tổng quát của lời giải chia để trị như sau. Trước tiên, tìm trọng tâm \(v\) của \(T\), rồi kiểm tra xem \(v\) có thuộc giao của tất cả các miền hay không. Nếu có, ta đã tìm được đáp án. Nếu không, nhưng giao ấy khác rỗng, thì toàn bộ giao phải nằm trong đúng một cây thành phần thu được sau khi xóa \(v\). Ta xác định cây thành phần đó rồi tiếp tục đệ quy trong nó.

Sau khi tìm trọng tâm \(v\), tính khoảng cách từ \(v\) tới các đỉnh đang xét trong \(O(n)\). Dùng các khoảng cách ấy và công thức (1), ta kiểm tra \(v\) có thuộc từng miền hay không trong tổng thời gian \(O(m)\). Nếu \(v\) thuộc mọi miền, thuật toán dừng và trả về \(v\).

Gọi \(\mathcal{T}_v\) là tập các cây thành phần sinh ra khi xóa \(v\) khỏi \(T\). Vì \(v\) không thuộc giao, tồn tại ít nhất một miền \(i\), được xác định bởi \(a_i,b_i,d_i\), không chứa \(v\). Hai đỉnh \(a_i,b_i\) phải nằm trong cùng một cây \(F\in\mathcal{T}_v\). Thật vậy, mọi đỉnh trên đường đi từ \(a_i\) đến \(b_i\) đều thuộc miền \(i\). Nếu \(a_i,b_i\) thuộc hai thành phần khác nhau thì đường đi ấy phải qua \(v\), trái với việc \(v\) không thuộc miền \(i\).

Hơn nữa, toàn bộ miền \(i\) nằm trong \(F\). Do đó, nếu giao của tất cả các miền khác rỗng, giao ấy cũng phải nằm trong \(F\). Ta chỉ cần gọi đệ quy trên \(F\), không cần xét các thành phần còn lại.

Một mức đệ quy có thể được cài đặt trong \(O(n+m)\), với \(n\) là kích thước cây hiện đang xét. Theo định nghĩa trọng tâm, sau mỗi bước, kích thước cây giảm ít nhất một nửa. Vì vậy, độ sâu đệ quy là \(O(\log n)\), cho cận thời gian trực tiếp

\[
O((n+m)\log n).
\]

Có thể siết cận này tốt hơn. Ở mỗi mức, lượng công việc xử lý các đỉnh tỉ lệ với kích thước phần cây hiện tại, mà kích thước này giảm ít nhất một nửa sau mỗi bước. Vì

\[
n+\frac n2+\frac n4+\cdots\le 2n,
\]

tổng thời gian dành cho các đỉnh chỉ là \(O(n)\). Tuy nhiên, ở mỗi mức ta vẫn có thể phải duyệt cả \(m\) miền. Do đó, tổng thời gian là

\[
O(n+m\log n).
\]

Điều quan trọng là sau khi tìm trọng tâm, ta không thể đơn giản gọi đệ quy trên **mọi** cây trong \(\mathcal{T}_v\). Dù các cây thành phần là những phần rời nhau của cây đầu vào, một miền có thể giao với nhiều cây trong \(\mathcal{T}_v\). Khi ấy, miền đó sẽ bị xử lý trong nhiều lời gọi đệ quy ở cùng một mức, khiến thời gian chạy tăng đáng kể. Lập luận ở trên cho phép ta chỉ đi vào một cây thành phần duy nhất.

## Lời giải nhanh hơn

Bài toán còn có một thuật toán vừa nhanh hơn vừa đơn giản hơn; phần khó hơn nằm ở chứng minh tính đúng đắn.

Chọn một đỉnh \(v\) tùy ý. Ta định nghĩa **khoảng cách từ miền \(i\) đến \(v\)** là khoảng cách giữa \(v\) và đỉnh gần \(v\) nhất thuộc miền \(i\). Với miền \(i\) được mô tả bởi \(a_i,b_i,d_i\), khoảng cách này bằng

\[
\max\left(
0,
\left\lceil
\frac{d(a_i,v)+d(v,b_i)-d_i}{2}
\right\rceil
\right). \tag{2}
\]

Công thức có thể thấy trực tiếp từ cấu trúc của cây. Đường đi từ \(a_i\) đến \(v\) và đường đi từ \(v\) đến \(b_i\) có một đoạn thừa đối xứng so với một lộ trình đi từ \(a_i\) đến \(b_i\). Khi đi một cạnh từ \(v\) theo hướng tới miền, tổng \(d(a_i,x)+d(x,b_i)\) giảm nhiều nhất \(2\). Vì thế, phần vượt quá giới hạn \(d_i\) phải được bù theo từng cặp đơn vị; phép làm tròn lên xử lý trường hợp phần vượt là số lẻ. Nếu \(v\) đã thuộc miền thì khoảng cách bằng \(0\).

Ý tưởng thuật toán chỉ gồm vài bước:

1. Tìm miền \(i\) nằm xa \(v\) nhất.
2. Trong miền \(i\), tìm đỉnh \(p\) gần \(v\) nhất.
3. Kiểm tra xem \(p\) có thuộc mọi miền hay không.

Sự kiện then chốt là: **nếu giao của tất cả các miền khác rỗng, thì \(p\) thuộc giao ấy**. Điều này đúng với mọi lựa chọn đỉnh ban đầu \(v\), dù những lựa chọn khác nhau có thể dẫn tới những đỉnh \(p\) khác nhau.

![Hình 1. Cây được gốc hóa tại \(v\) cùng ba miền đánh số \(1,2,3\). Miền \(2\) nằm xa \(v\) nhất; \(p\) là đỉnh gần \(v\) nhất thuộc miền \(2\).](figures/2014-jas-fig-1.png)

Để chứng minh sự kiện trên, gốc hóa toàn bộ cây tại \(v\). Giao của mọi miền, nếu tồn tại, phải nằm trong cây con gốc tại \(p\), bởi trong số các đỉnh của miền \(i\), \(p\) là đỉnh gần gốc nhất và mọi đỉnh khác của miền \(i\) nằm trong cây con ấy.

Mặt khác, nếu một miền \(j\) chứa một đỉnh trong cây con gốc tại \(p\), thì nó cũng phải chứa \(p\). Nếu không, miền \(j\) sẽ nằm xa \(v\) hơn miền \(i\), trái với cách chọn \(i\). Vì vậy, nếu giao của tất cả các miền khác rỗng thì \(p\) thuộc mọi miền, tức chính \(p\) là một đáp án.

### Cài đặt thuật toán tuyến tính

Thuật toán có thể được cài đặt trong thời gian \(O(n+m)\) cho mỗi bộ test theo tổng kích thước dữ liệu:

1. Chọn một đỉnh \(v\) tùy ý và tính khoảng cách từ \(v\) tới mọi đỉnh của cây trong \(O(n)\).
2. Dùng công thức (2) để tính khoảng cách từ \(v\) tới từng miền trong \(O(1)\), rồi chọn một miền \(i\) có khoảng cách lớn nhất. Tổng thời gian của bước này là \(O(m)\).
3. Tính khoảng cách từ \(a_i\) và từ \(b_i\) tới tất cả các đỉnh. Nhờ công thức (1), với mỗi đỉnh \(x\), ta kiểm tra được trong \(O(1)\) liệu \(x\) có thuộc miền \(i\) hay không.
4. Duyệt mọi đỉnh thuộc miền \(i\) và chọn đỉnh \(p\) có khoảng cách tới \(v\) nhỏ nhất. Bước này tốn \(O(n)\).
5. Tính khoảng cách từ \(p\) tới mọi đỉnh. Với từng miền \(j\), kiểm tra

\[
d(a_j,p)+d(p,b_j)\le d_j.
\]

Nếu bất đẳng thức đúng với mọi \(j\), in `TAK p`; nếu có miền không chứa \(p\), in `NIE`.

Mỗi lượt tính khoảng cách trên cây có thể thực hiện bằng DFS hoặc BFS trong \(O(n)\). Ta chỉ thực hiện một số hằng các lượt duyệt cây và một số hằng các lượt duyệt danh sách miền. Vì thế, độ phức tạp của mỗi bộ test là

\[
O(n+m)
\]

về thời gian và

\[
O(n+m)
\]

về bộ nhớ. Với các giới hạn cộng dồn trong đề, tổng thời gian trên toàn bộ dữ liệu vào cũng là \(O(\sum n+\sum m)\).
