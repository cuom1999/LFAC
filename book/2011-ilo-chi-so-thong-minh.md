# Chỉ số thông minh ★★★

**Tác giả đề:** Marek Cygan  
**Tác giả lời giải:** Eryk Kopczyński  
**Bộ nhớ:** 128 MB  
**Mã bài:** `ilo`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2011/ilo>


## Đề bài

Ở Đại học Byteland chỉ có hai ngành: toán học và khoa học máy tính. Hiện có $n$ sinh viên toán và $m$ sinh viên khoa học máy tính. Hai ngành này khó đến mức không ai đồng thời theo học cả hai ngành.

Byteasar là hiệu trưởng trường. Ông muốn lập một đội sinh viên để giải những bài toán khó nhất của nhân loại. Biết chỉ số thông minh (IQ) của từng sinh viên, ông muốn tổng IQ của đội là lớn nhất có thể.

Tuy nhiên, IQ không phải tất cả: Byteasar còn yêu cầu mọi thành viên trong đội phải quen biết nhau. Mọi sinh viên toán đều quen mọi sinh viên toán khác; tương tự, mọi sinh viên khoa học máy tính đều quen nhau. Hãy giúp Byteasar lập một đội thỏa các điều kiện trên và có tổng IQ lớn nhất.

### Dữ liệu vào

Dòng đầu chứa ba số nguyên $n,m,k$ ($1\le n,m\le400$, $0\le k\le n\cdot m$), lần lượt là số sinh viên toán, số sinh viên khoa học máy tính, và số cặp sinh viên khác ngành quen nhau.

$k$ dòng tiếp theo mô tả các cặp quen biết. Dòng thứ $i$ chứa hai số nguyên $a_i,b_i$ ($1\le a_i\le n$, $1\le b_i\le m$): sinh viên toán số $a_i$ quen sinh viên khoa học máy tính số $b_i$. Sinh viên trong mỗi ngành đều được đánh số từ $1$.

Dòng kế tiếp chứa $n$ số nguyên trong đoạn $[1,10^9]$, là IQ của các sinh viên toán theo thứ tự đánh số. Dòng cuối chứa $m$ số nguyên, là IQ của các sinh viên khoa học máy tính theo cùng cách.

### Dữ liệu ra

Dòng đầu in tổng IQ lớn nhất của một đội thỏa yêu cầu.

Dòng thứ hai in số sinh viên toán được chọn; dòng thứ ba in các số hiệu của họ theo thứ tự bất kỳ. Nếu không chọn sinh viên toán nào, dòng thứ ba để trống.

Hai dòng tiếp theo mô tả tương tự số lượng và các số hiệu sinh viên khoa học máy tính được chọn.

Nếu có nhiều đáp án, được phép in bất kỳ đáp án nào.

### Ví dụ

**Dữ liệu vào**

```text
3 2 3
1 1
2 1
2 2
1 3 1
1 2
```

**Kết quả có thể có**

```text
6
1
2
2
1 2
```

Ở đây chọn sinh viên toán số $2$, cùng hai sinh viên khoa học máy tính số $1,2$. Ba sinh viên này đôi một quen biết và có tổng IQ $3+1+2=6$.

## Lời giải

Gọi $V_1$ là tập sinh viên toán, $V_2$ là tập sinh viên khoa học máy tính. Dựng đồ thị hai phía

\[
G=(V_1,V_2,E),
\]

trong đó một cạnh biểu diễn một cặp sinh viên khác ngành quen nhau. Mỗi đỉnh $v$ có trọng số $w(v)$, chính là IQ của sinh viên đó.

Trong mỗi phía, mọi cặp sinh viên vốn đã quen nhau. Vì vậy, một tập sinh viên là đội hợp lệ khi và chỉ khi mọi cặp gồm một đỉnh thuộc $V_1$ và một đỉnh thuộc $V_2$ trong tập đó đều là cạnh của $G$. Nói cách khác, ta cần tìm một **clique hai phía có tổng trọng số lớn nhất**.

### Đồ thị bù và tập độc lập

Xét đồ thị hai phía bù

\[
G'=(V_1,V_2,E'),\qquad E'=(V_1\times V_2)\setminus E.
\]

Một cạnh của $G'$ nối đúng hai sinh viên **không** quen nhau. Do đó, một đội hợp lệ trong $G$ chính là một **tập độc lập** trong $G'$: trong tập được chọn không có cạnh nào của $G'$.

![Hình 1. Bên trái: đồ thị quen biết $G$ với clique hai phía lớn nhất tô cam. Bên phải: đồ thị bù $G'$ với một ghép cực đại (cạnh đậm), phủ đỉnh nhỏ nhất (đỉnh đen) và tập độc lập lớn nhất (đỉnh cam).](figures/2011-ilo-fig-1.png)

Phần bù của một tập độc lập là một **phủ đỉnh**. Một phủ đỉnh là tập $P\subseteq V_1\cup V_2$ sao cho mọi cạnh của $G'$ có ít nhất một đầu mút thuộc $P$. Vì IQ đều dương, và thực ra với mọi trọng số nói chung, ta có

\[
w(V_1\cup V_2\setminus P)=w(V_1\cup V_2)-w(P).
\]

Vì tổng trọng số của tất cả đỉnh là hằng số, tối đa hóa trọng số tập độc lập tương đương với tìm **phủ đỉnh có tổng trọng số nhỏ nhất** trong $G'$. Sau khi tìm được phủ đỉnh nhẹ nhất $P$, đội cần in chính là

\[
(V_1\cup V_2)\setminus P.
\]

### Quy về bài toán luồng cực đại

Ta tìm phủ đỉnh nhẹ nhất bằng luồng cực đại / lát cắt nhỏ nhất. Tạo mạng $H$ như sau:

- Thêm nguồn $s$ và đích $t$.
- Với mỗi $u\in V_1$, thêm cung $s\to u$ có dung lượng $w(u)$.
- Với mỗi $v\in V_2$, thêm cung $v\to t$ có dung lượng $w(v)$.
- Với mỗi cạnh $uv\in E'$, thêm cung $u\to v$ có dung lượng $\infty$.

Ở đây $\infty$ chỉ cần lớn hơn tổng IQ của toàn bộ sinh viên; chẳng hạn đặt `INF = totalIQ + 1` là đủ và tránh tràn số.

Xét một lát cắt hữu hạn của mạng. Nó không thể cắt bất kỳ cung dung lượng vô hạn nào. Do đó, với mỗi cạnh không-quen-biết $uv\in E'$, lát cắt bắt buộc phải cắt hoặc cung $s\to u$, hoặc cung $v\to t$. Diễn giải việc cắt $s\to u$ là đưa $u$ vào phủ đỉnh, và việc cắt $v\to t$ là đưa $v$ vào phủ đỉnh. Ta nhận được đúng điều kiện “mỗi cạnh của $G'$ có một đầu mút được chọn”.

Ngược lại, từ mọi phủ đỉnh $P$ của $G'$, cắt các cung $s\to u$ với $u\in P\cap V_1$ và các cung $v\to t$ với $v\in P\cap V_2$. Vì $P$ che mọi cạnh $uv\in E'$, không còn đường nào từ $s$ đến $t$. Giá trị lát cắt đúng bằng tổng IQ của các đỉnh trong $P$.

Vậy có tương ứng một-một giữa các lát cắt hữu hạn và các phủ đỉnh, đồng thời giá trị của chúng bằng nhau. Theo định lý luồng cực đại – lát cắt nhỏ nhất, giá trị luồng cực đại bằng trọng số phủ đỉnh nhẹ nhất.

![Hình 2. Mạng luồng $H$: bên trái là một luồng cực đại (cạnh đậm), bên phải là lát cắt nhỏ nhất tương ứng (cạnh cam).](figures/2011-ilo-fig-2.png)

### Lấy lại các sinh viên được chọn

Sau khi chạy thuật toán luồng cực đại, xét đồ thị dư. Gọi $X$ là tập các đỉnh đi tới được từ $s$ chỉ qua những cung dư có dung lượng dương.

![Hình 3. Đồ thị dư của luồng ở hình 2; các đỉnh đen thuộc tập $X$, còn các cạnh cam tương ứng với lát cắt nhỏ nhất trong mạng gốc.](figures/2011-ilo-fig-3.png)

Lát cắt nhỏ nhất tương ứng gồm các cung của mạng gốc đi từ $X$ sang phần còn lại. Suy ra phủ đỉnh nhẹ nhất là

\[
P = (V_1\setminus X)\ \cup\ (V_2\cap X).
\]

Thật vậy, một đỉnh $u\in V_1$ thuộc phủ khi cung $s\to u$ đi từ $X$ ra ngoài, tức $u\notin X$. Một đỉnh $v\in V_2$ thuộc phủ khi cung $v\to t$ đi từ $X$ ra ngoài, tức $v\in X$.

Vì đội là phần bù của phủ đỉnh, ta in:

\[
\text{đội}\cap V_1=V_1\cap X,\qquad
\text{đội}\cap V_2=V_2\setminus X.
\]

Tổng IQ đáp án bằng `totalIQ - maxFlow` (tương đương tổng trọng số của các đỉnh vừa in).

### Chứng minh tính đúng đắn

Ta chứng minh thuật toán luôn in một đội hợp lệ có tổng IQ lớn nhất.

**Bổ đề 1.** Một tập sinh viên là đội hợp lệ khi và chỉ khi nó là tập độc lập của $G'$.

**Chứng minh.** Trong cùng một ngành, mọi sinh viên quen nhau. Với hai sinh viên khác ngành, họ không quen nhau đúng khi và chỉ khi cặp tương ứng là cạnh của $G'$. Vì thế mọi thành viên đôi một quen nhau đúng khi tập không chứa cả hai đầu mút của bất kỳ cạnh nào trong $G'$, tức là tập độc lập. \(\square\)

**Bổ đề 2.** Phần bù của một tập độc lập trong $G'$ là một phủ đỉnh, và ngược lại.

**Chứng minh.** Nếu phần bù không che một cạnh, cả hai đầu mút của cạnh đó đều nằm trong tập độc lập — mâu thuẫn. Chiều ngược lại hoàn toàn tương tự: nếu phần bù của phủ đỉnh chứa một cạnh thì phủ đỉnh không che cạnh ấy. \(\square\)

**Bổ đề 3.** Giá trị lát cắt nhỏ nhất trong mạng $H$ bằng trọng số phủ đỉnh nhẹ nhất của $G'$.

**Chứng minh.** Các cung có dung lượng vô hạn không xuất hiện trong một lát cắt tối ưu hữu hạn. Vì vậy, mọi lát cắt hữu hạn phải chọn, với từng cạnh $uv\in E'$, ít nhất một trong hai cung $s\to u$, $v\to t$; tập đầu mút được chọn là một phủ đỉnh và giá trị lát cắt bằng trọng số của nó. Ngược lại, mọi phủ đỉnh tạo ra một lát cắt chỉ gồm các cung tương ứng, có đúng cùng giá trị. Do đó hai giá trị tối ưu bằng nhau. \(\square\)

**Bổ đề 4.** Công thức từ tập đỉnh tới được $X$ thu được chính xác một phủ đỉnh nhẹ nhất.

**Chứng minh.** Sau luồng cực đại, các cung gốc từ $X$ sang phần bù của $X$ tạo thành một lát cắt nhỏ nhất. Áp dụng tương ứng trong Bổ đề 3 cho những cung $s\to V_1$ và $V_2\to t$, ta nhận được $P=(V_1\setminus X)\cup(V_2\cap X)$, là phủ đỉnh có trọng số nhỏ nhất. \(\square\)

**Định lý.** Đội mà thuật toán in ra là hợp lệ và có tổng IQ lớn nhất.

**Chứng minh.** Theo Bổ đề 4, thuật toán tìm được phủ đỉnh nhẹ nhất $P$. Theo Bổ đề 2, phần bù của $P$ là một tập độc lập; theo Bổ đề 1, đó là một đội hợp lệ. Vì phần bù của phủ đỉnh có trọng số nhỏ nhất có trọng số lớn nhất, không đội hợp lệ nào có tổng IQ lớn hơn đội được in. \(\square\)

### Độ phức tạp

Đồ thị bù có nhiều nhất $nm\le160\,000$ cạnh. Mạng luồng có

\[
|V_H|=n+m+2,\qquad |E_H|=|E'|+n+m
\]

cung gốc (mỗi cung thường được lưu cùng cung ngược trong cài đặt).

Có thể dùng Dinic với cận tổng quát $O(|V_H|^2|E_H|)$, phù hợp với giới hạn của bài. Bản mô tả gốc cũng nêu thuật toán **scaling flow**: vì dung lượng hữu hạn nhỏ hơn $2^B$, nó chạy trong $O(B|V_H|^3)$, với $B\le40$ cho các giá trị của bài. Bộ nhớ cần $O(|V_H|+|E_H|)$.

## Ghi chú nguồn

Lời giải trên dịch và diễn giải từ phần *Intelligence Quotient* trong bản tiếng Anh của *Looking for a Challenge 2*. Bản gốc trước hết liên hệ trường hợp mọi trọng số bằng $1$ với định lý König về matching cực đại và phủ đỉnh nhỏ nhất; cách xây dựng mạng luồng ở trên là dạng tổng quát trực tiếp cho trọng số IQ bất kỳ.
