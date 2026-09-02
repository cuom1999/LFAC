# Xăng ★★★

**Tác giả đề:** Jakub Łącki  
**Tác giả lời giải:** Adam Karczmarz  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `ben`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2014/ben>


## Đề bài

Bajtazar làm việc trong bộ phận hậu cần của tập đoàn dầu khí Bytean khổng lồ Bajtoil. Công việc của anh là lập kế hoạch vận chuyển nhiên liệu đến các trạm xăng.

Byteotia có (n) giao lộ, được đánh số từ (1) đến (n), cùng (m) con đường hai chiều nối một số cặp giao lộ. Tại một số giao lộ có trạm xăng của Bajtoil.

Đội xe vận tải của Bajtoil gồm những xe bồn có bình nhiên liệu với nhiều dung tích khác nhau. Mỗi xe tiêu thụ (1) lít xăng trên mỗi kilômét di chuyển. Vì vậy, có thể xem một xe với bình chứa (b) lít đi được nhiều nhất (b) kilômét mà không cần tiếp nhiên liệu. Tài xế không được dùng lượng xăng nằm trong bồn hàng của xe, nhưng có thể đổ đầy bình nhiên liệu miễn phí tại bất kỳ trạm xăng Bajtoil nào.

Trong công việc, Bajtazar phải nhiều lần trả lời câu hỏi sau: một xe bồn có bình nhiên liệu dung tích (b) lít có thể đi từ trạm xăng tại giao lộ (x) đến trạm xăng tại giao lộ (y) hay không? Xe đó không thể đi quá (b) kilômét liên tiếp mà không gặp một trạm xăng Bajtoil. Mọi chuyến đi đều bắt đầu và kết thúc tại giao lộ có trạm xăng Bajtoil.

Hãy giúp Bajtazar tự động trả lời các truy vấn hậu cần này.

### Dữ liệu vào

Dòng đầu chứa ba số nguyên (n,s,m)

\[
2\le s\le n\le200\,000,\qquad 1\le m\le200\,000,
\]

lần lượt là số giao lộ, số trạm xăng và số con đường ở Byteotia.

Dòng thứ hai chứa (s) số nguyên đôi một khác nhau

\[
c_1,c_2,\ldots,c_s\qquad (1\le c_i\le n),
\]

cho biết các giao lộ có trạm xăng Bajtoil.

Mỗi trong (m) dòng tiếp theo chứa ba số nguyên \(u_i,v_i,d_i\)

\[
1\le u_i,v_i\le n,\qquad u_i\ne v_i,\qquad 1\le d_i\le10\,000,
\]

nghĩa là con đường thứ (i) dài \(d_i\) kilômét và nối hai giao lộ \(u_i\), \(v_i\). Giữa mỗi cặp giao lộ có nhiều nhất một con đường.

Dòng kế tiếp chứa số nguyên (q) ((1\le q\le200\,000)), là số truy vấn. Mỗi trong (q) dòng sau chứa ba số nguyên \(x_i,y_i,b_i\)

\[
1\le x_i,y_i\le n,\qquad x_i\ne y_i,\qquad 1\le b_i\le2\cdot10^9,
\]

mô tả truy vấn liệu một xe bồn có bình nhiên liệu dung tích \(b_i\) lít có thể đi từ trạm tại giao lộ \(x_i\) đến trạm tại giao lộ \(y_i\) hay không. Bảo đảm cả \(x_i\) lẫn \(y_i\) đều có trạm xăng Bajtoil.

### Dữ liệu ra

In đúng (q) dòng. Dòng thứ (i) chứa từ `TAK` (có) hoặc `NIE` (không), tùy theo xe có bình nhiên liệu dung tích \(b_i\) lít có thể đi từ giao lộ \(x_i\) đến giao lộ \(y_i\) hay không.

### Ví dụ

**Dữ liệu vào**

```text
6 4 5
1 5 2 6
1 3 1
2 3 2
3 4 3
4 5 5
6 4 5
4
1 2 4
2 6 9
1 5 9
6 5 8
```

**Dữ liệu ra**

```text
TAK
TAK
TAK
NIE
```

## Lời giải

Ta xem mạng lưới đường sá là đồ thị \(G=(V,E)\), trong đó các đỉnh ứng với giao lộ và các cạnh ứng với đường. Với cạnh \((u,v)\in E\), ký hiệu \(c(u,v)\) là chiều dài con đường từ \(u\) đến \(v\), tính bằng kilômét. Ngoài ra, ta có tập đỉnh đặc biệt \(S\subseteq V\) gồm các giao lộ có trạm xăng.

Mỗi truy vấn cho hai đỉnh \(x,y\in S\) và một số \(b\), rồi hỏi liệu có đường đi \(P\) từ \(x\) đến \(y\) sao cho khi cắt \(P\) tại mọi đỉnh thuộc \(S\), mỗi đoạn thu được đều dài không quá \(b\). Ta gọi một đường đi như vậy là **tốt**, và ký hiệu truy vấn là \((x,y,b)\).

### Đặc trưng của một đường đi tốt

Trước hết, giả sử chỉ cần trả lời một truy vấn \((x,y,b)\). Với mỗi đỉnh \(v\), gọi \(d_S(v)\) là khoảng cách từ \(v\) đến đỉnh gần nhất thuộc \(S\). Đặc biệt, \(d_S(v)=0\) nếu \(v\in S\). Với mỗi cạnh \((u,v)\in E\), đặt

\[
c^*(u,v):=d_S(u)+c(u,v)+d_S(v).
\]

Ta sẽ chứng minh rằng, với một giá trị \(b\) cố định, tồn tại đường đi tốt từ \(x\) đến \(y\) khi và chỉ khi giữa \(x\) và \(y\) có một đường đi chỉ gồm những cạnh \((u,v)\) thỏa

\[
c^*(u,v)\le b. \tag{1}
\]

Trước tiên, giả sử một cạnh \((u,v)\) có \(c^*(u,v)>b\). Không đường đi tốt nào giữa hai đỉnh thuộc \(S\) có thể dùng cạnh này. Thật vậy, nếu một hành trình đi qua \((u,v)\), nó phải chứa một đoạn gồm ba phần liên tiếp:

1. từ một đỉnh \(s_1\in S\) đến \(u\), dài ít nhất \(d_S(u)\);
2. cạnh \((u,v)\), dài \(c(u,v)\);
3. từ \(v\) đến một đỉnh \(s_2\in S\), dài ít nhất \(d_S(v)\).

Đoạn không có trạm xăng ở bên trong ấy dài ít nhất

\[
d_S(u)+c(u,v)+d_S(v)=c^*(u,v)>b,
\]

trái với định nghĩa của đường đi tốt.

Theo chiều ngược lại, giả sử trong \(G\) có đường đi

\[
x=v_1,v_2,\ldots,v_p=y
\]

mà \(c^*(v_i,v_{i+1})\le b\) với mọi \(i=1,\ldots,p-1\). Với mỗi đỉnh \(v\), chọn một đỉnh \(l_S(v)\in S\) gần \(v\) nhất, tức khoảng cách từ \(v\) đến \(l_S(v)\) đúng bằng \(d_S(v)\). Vì \(x,y\in S\), ta có thể chọn \(l_S(x)=x\) và \(l_S(y)=y\).

Giờ hãy ghép các đoạn sau thành một hành trình \(P\): với mỗi \(i=1,\ldots,p-1\), đi theo một đường ngắn nhất từ \(l_S(v_i)\) đến \(v_i\), đi qua cạnh \((v_i,v_{i+1})\), rồi theo một đường ngắn nhất từ \(v_{i+1}\) đến \(l_S(v_{i+1})\). Mỗi đoạn như vậy bắt đầu và kết thúc tại trạm xăng, đồng thời có độ dài

\[
d_S(v_i)+c(v_i,v_{i+1})+d_S(v_{i+1})
=c^*(v_i,v_{i+1})\le b.
\]

Nối các đoạn này lại cho ta một đường đi tốt từ \(x\) đến \(y\). Hành trình có thể đi lặp qua một số cạnh hay đỉnh, nhưng điều đó không ảnh hưởng đến tính hợp lệ.

Vậy với \(b\) cố định, tồn tại đường đi tốt từ \(x\) đến \(y\) khi và chỉ khi \(x\) và \(y\) nằm trong cùng một thành phần liên thông của đồ thị

\[
G_b=\bigl(V,\{(u,v)\in E:c^*(u,v)\le b\}\bigr). \tag{2}
\]

### Thuật toán offline

Bước đầu tiên là tính \(c^*(u,v)\) cho mọi cạnh. Muốn vậy, ta cần biết \(d_S(v)\) với mọi \(v\in V\). Hãy thêm vào \(G\) một **siêu đỉnh** \(z\), rồi nối \(z\) với mỗi đỉnh thuộc \(S\) bằng một cạnh độ dài 0, tạo thành đồ thị \(G'\). Khi đó, \(d_S(v)\) chính là khoảng cách từ \(z\) đến \(v\) trong \(G'\).

Do mọi độ dài cạnh đều không âm, chạy Dijkstra từ \(z\) sẽ tìm được toàn bộ các giá trị \(d_S(\cdot)\) trong thời gian

\[
O((n+m)\log n).
\]

Sau đó, tính trực tiếp \(c^*(u,v)\) cho tất cả các cạnh.

Ta không buộc phải trả lời một truy vấn trước khi đọc truy vấn kế tiếp. Vì vậy, hãy đọc toàn bộ truy vấn, sắp xếp chúng không giảm theo \(b_i\), rồi trả lời theo thứ tự đó. Giả sử sau khi sắp xếp ta có

\[
(x_1,y_1,b_1),\ldots,(x_q,y_q,b_q),
\qquad b_1\le b_2\le\cdots\le b_q.
\]

Đồng thời, sắp xếp các cạnh không giảm theo trọng số \(c^*(u,v)\). Ban đầu đặt \(H\) là đồ thị trên tập đỉnh \(V\) nhưng chưa có cạnh. Khi xử lý truy vấn thứ \(i\), thêm vào \(H\) tất cả những cạnh chưa thêm có

\[
c^*(u,v)\le b_i.
\]

Lúc này \(H\) chính là \(G_{b_i}\). Theo (2), câu trả lời là `TAK` khi và chỉ khi \(x_i\), \(y_i\) thuộc cùng một thành phần liên thông của \(H\).

Ta duy trì các thành phần liên thông của \(H\) bằng cấu trúc tập hợp rời nhau DSU (còn gọi là *union-find*). Thêm cạnh tương ứng với phép hợp nhất hai tập; kiểm tra hai đỉnh có nối với nhau hay không tương ứng với hai phép tìm đại diện. Với gộp theo hạng/kích thước và nén đường đi, tổng thời gian cho \(m+q\) thao tác là

\[
O((m+q)\log^* n),
\]

nhỏ hơn \(O((m+q)\log n)\). Phải lưu chỉ số ban đầu của mỗi truy vấn để đưa các câu trả lời về đúng thứ tự xuất hiện trong dữ liệu vào.

Tính cả Dijkstra và hai lần sắp xếp, toàn bộ thuật toán chạy trong

\[
O((n+m+q)\log(n+q))
\]

thời gian và dùng \(O(n+m+q)\) bộ nhớ.

## Trả lời truy vấn trực tuyến

Thuật toán trên đủ để giải bài trong cuộc thi, nhưng nó cần biết trước mọi truy vấn và xử lý chúng theo dung tích bình nhiên liệu tăng dần. Trong thực tế, một trạm có thể bất ngờ hết xăng và việc giao hàng phải được lập tức lên kế hoạch; cũng không thể giả sử theo thời gian người ta chỉ gửi đến các xe có bình ngày càng lớn.

Ta sẽ sửa lời giải để có thể trả lời độc lập mỗi truy vấn trong thời gian \(O(\log n)\). Nhắc lại rằng truy vấn \((x,y,b)\) tương đương với việc kiểm tra \(x\), \(y\) có thuộc cùng thành phần của \(G_b\) hay không.

Mục tiêu là xây dựng một rừng \(F\) gồm các cây có gốc, có trọng số cạnh, trên tập đỉnh \(V\), thỏa hai tính chất:

1. Với mọi \(b\) và mọi \(v,w\in V\), hai đỉnh \(v,w\) thuộc cùng thành phần của \(G_b\) khi và chỉ khi trong \(F\) có đường đi giữa chúng và không cạnh nào trên đường ấy có trọng số lớn hơn \(b\).
2. Chiều cao của mọi cây trong \(F\) không vượt quá \(\log_2 n\).

Nếu chỉ cần tính chất thứ nhất, ta có thể dùng nhận xét quen thuộc sau.

**Nhận xét 1.** Xét một đồ thị vô hướng có trọng số, hai đỉnh bất kỳ \(v,w\) và một số \(b\). Trong đồ thị có đường đi từ \(v\) đến \(w\) chỉ gồm những cạnh trọng số không quá \(b\) khi và chỉ khi trong một rừng khung nhỏ nhất của đồ thị cũng có một đường đi như vậy.

Ở đây rừng khung nhỏ nhất được tạo bằng cách tìm một cây khung nhỏ nhất trong từng thành phần liên thông. Vì thế, rừng khung nhỏ nhất của \(G\) với trọng số cạnh \(c^*(u,v)\) là một ứng viên cho tính chất thứ nhất, nhưng không nhất thiết có chiều cao lôgarit. Ta sẽ dùng một cách xây dựng hơi khác.

Giả sử trước mắt đã có rừng \(F\) thỏa cả hai tính chất. Với mỗi đỉnh \(v\) không phải gốc, gọi \(p(v)\) là cha của nó. Bắt đầu tại \(v\), liên tục đi lên cha chừng nào đỉnh hiện tại chưa phải gốc và cạnh nối nó với cha có trọng số không quá \(b\). Gọi đỉnh dừng lại là \(r_b(v)\).

Hai đỉnh \(v,w\) được nối trong \(F\) bằng một đường mà mọi trọng số cạnh đều không quá \(b\) khi và chỉ khi

\[
r_b(v)=r_b(w). \tag{3}
\]

Tính chất thứ nhất biến (3) thành điều kiện tương đương với việc \(v,w\) cùng thành phần của \(G_b\). Tính chất thứ hai cho phép tính mỗi \(r_b(\cdot)\) bằng cách đi lên nhiều nhất \(O(\log n)\) cạnh. Do đó, một truy vấn được trả lời trong \(O(\log n)\). Ta chỉ còn phải xây dựng \(F\).

### Xây dựng rừng

Nếu xóa khỏi một rừng thỏa hai tính chất trên mọi cạnh có trọng số lớn hơn một giá trị \(B\), ta được một rừng mà tính chất thứ nhất vẫn đúng với mọi \(b\le B\). Gọi rừng ấy là \(F_B\). Ta sẽ xây dựng \(F_B\) với các giá trị \(B\) tăng dần bằng cách xét các cạnh theo trọng số \(c^*(u,v)\) tăng dần. Cuối cùng thu được \(F=F_C\), trong đó \(C\) là trọng số \(c^*\) lớn nhất.

Khởi đầu là rừng rỗng \(F_0\), không có cạnh; khi ấy \(p(v)\) chưa xác định với mọi \(v\). Với mỗi đỉnh \(v\), ta còn duy trì \(h(v)\), chiều cao của cây con có gốc tại \(v\). Ban đầu \(h(v)=0\). Rừng \(F_0\) hiển nhiên thỏa tính chất thứ nhất đối với mọi \(b\le0\).

Để dễ trình bày, trước hết giả sử các trọng số \(c^*(u,v)\) đôi một khác nhau. Xét cạnh \((u,v)\) kế tiếp có trọng số \(B=c^*(u,v)\). Trong rừng tạo bởi các cạnh nhẹ hơn \(B\), tìm

\[
x=r_{B^-}(u),\qquad y=r_{B^-}(v),
\]

tức gốc hai cây hiện chứa \(u,v\). Việc này tốn \(O(h(x)+h(y))\) thời gian bằng cách đi theo các cạnh của rừng. Không mất tính tổng quát, giả sử \(h(x)\ge h(y)\).

Nếu \(x=y\), cạnh mới không làm thay đổi thành phần liên thông, nên không cần làm gì. Nếu \(x\ne y\), nối hai cây bằng cách đặt

\[
p(y)=x
\]

và gán trọng số \(B\) cho cạnh mới từ \(y\) đến \(x\). Nếu \(h(x)=h(y)\), tăng \(h(x)\) thêm 1; nếu không, chiều cao của cây gốc \(x\) giữ nguyên. Đây chính là phép hợp nhất theo hạng, nhưng các cạnh trong rừng nối hai **gốc thành phần**, thay vì nhất thiết sao chép cạnh \((u,v)\) gốc. Lập luận quy nạp trực tiếp theo các cạnh đã xét cho thấy rừng mới tiếp tục thỏa tính chất thứ nhất với mọi ngưỡng đến \(B\).

Nếu nhiều cạnh có cùng trọng số, chỉ cần xử lý chúng liên tiếp ở cùng ngưỡng \(B\). Các phép nối gốc đều được gán trọng số \(B\); sau khi xử lý hết nhóm, rừng thu được biểu diễn đúng các thành phần của \(G_B\). Lập luận trên không thay đổi.

### Giới hạn chiều cao

Ta chứng minh rằng tại mọi thời điểm, cây con có gốc tại \(v\) chứa ít nhất

\[
2^{h(v)}
\]

đỉnh. Ban đầu \(h(v)=0\), mỗi đỉnh đứng riêng nên mệnh đề đúng. Chiều cao không bao giờ giảm. Giá trị \(h(v)\) chỉ tăng khi ta gắn vào \(v\) một cây khác, có gốc \(w\ne v\), với \(h(w)=h(v)\). Trước khi nối, theo giả thiết quy nạp, mỗi cây có ít nhất \(2^{h(v)}\) đỉnh. Sau khi nối, cây gốc \(v\) có ít nhất

\[
2^{h(v)}+2^{h(v)}=2^{h(v)+1}
\]

đỉnh, đúng với chiều cao mới.

Do cả rừng chỉ có \(n\) đỉnh,

\[
2^{h(v)}\le n,
\qquad\text{nên}\qquad
h(v)\le\log_2 n.
\]

Vì thế tính chất thứ hai được bảo đảm. Rừng \(F\) dùng \(O(n)\) bộ nhớ và được xây dựng trong tổng thời gian

\[
O(n+m\log n),
\]

bao gồm việc sắp xếp cạnh và đi lên các cây có chiều cao lôgarit. Sau bước tiền xử lý Dijkstra để tính \(c^*\) và xây dựng \(F\), mỗi truy vấn có thể được đọc rồi trả lời ngay, độc lập với các truy vấn khác, trong thời gian

\[
O(\log n).
\]
