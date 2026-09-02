# Bộ sinh bit ★★★★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Tomasz Idziaszek  
**Bộ nhớ:** 64 MB  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2011/gen>


## Đề bài

Byteasar thích nghịch bộ sinh bit ngẫu nhiên (thực ra là giả ngẫu nhiên) mà cậu tìm thấy trên máy tính. Bộ sinh hoạt động rất đơn giản. Khi máy tính khởi động, một số nguyên trong đoạn từ \(0\) đến \(m-1\) được chọn tự động. Số nguyên này được gọi là **hạt giống** (*seed*) của bộ sinh; ta ký hiệu nó bằng biến \(z\). Mỗi lần cần sinh một bit, chương trình gọi hàm sau. Hàm cập nhật hạt giống rồi dùng giá trị mới để sinh ra một bit:

```pseudocode
z := floor((z · a + c) / k) mod m
if z < floor(m / 2) then
    return 0
else
    return 1
```

Các số \(a,c,k\) là những hằng số. Byteasar đã gọi hàm \(n\) lần và nhận được dãy bit \(b_1,b_2,\ldots,b_n\). Cậu muốn biết có bao nhiêu giá trị khác nhau có thể là hạt giống ban đầu.

### Dữ liệu vào

Dòng đầu chứa năm số nguyên \(a,c,k,m,n\) (\(0\le a,c<m\), \(1\le k<m\), \(2\le m\le1\,000\,000\), \(1\le n\le100\,000\)). Dòng thứ hai chứa một xâu dài \(n\), chỉ gồm các ký tự `0` và `1`; ký tự thứ \(i\) biểu diễn bit \(b_i\).

### Dữ liệu ra

In một số nguyên: số lượng các số nguyên trong đoạn từ \(0\) đến \(m-1\) có thể đã là hạt giống ban đầu của bộ sinh.

### Ví dụ

```text
Input
3 6 2 9 2
10

Output
4
```

Các hạt giống ban đầu có thể là \(1,2,7\) hoặc \(8\).

## Lời giải

Thoạt nhìn, bài toán có vẻ chỉ là mô phỏng; thực ra lời giải sử dụng cả lý thuyết đồ thị lẫn thuật toán trên xâu. Ta mô tả không gian trạng thái của bộ sinh bằng đồ thị. Sau đó, để tìm những hạt giống phù hợp, ta dùng hoặc **từ điển các đoạn cơ sở** (*dictionary of basic factors*), hoặc một automaton tìm mẫu trong xâu để được lời giải nhanh hơn.

Trạng thái của bộ sinh là số nguyên \(z\) trong đoạn \(0\) đến \(m-1\). Mỗi lần gọi hàm, trạng thái chuyển thành

\[
f(z)=\left\lfloor\frac{za+c}{k}\right\rfloor\bmod m,
\]

và bit được sinh là \(b(z)=0\) nếu \(f(z)<\lfloor m/2\rfloor\), ngược lại là \(1\). Vì \(a,c,k\) cố định, cả bit sinh ra lẫn trạng thái mới chỉ phụ thuộc vào trạng thái hiện tại \(z\).

Vì vậy, ta biểu diễn bộ sinh bằng một đồ thị có hướng. Đồ thị có \(m\) đỉnh \(v_0,v_1,\ldots,v_{m-1}\), tương ứng với mọi trạng thái có thể. Từ mỗi đỉnh \(v_i\) có đúng một cạnh đi tới \(v_{f(i)}\), và \(v_i\) mang nhãn \(b(i)\).

![Hình 1. Đồ thị chín trạng thái của bộ sinh trong ví dụ; các đỉnh màu cam mang nhãn bit 1.](figures/2011-gen-fig-1.png)

Gọi \(p(v_i,l\) là dãy nhãn trên đường đi gồm \(l\) đỉnh bắt đầu tại \(v_i\). Đường đi này được xác định duy nhất, vì mỗi đỉnh chỉ có một cạnh đi ra. Bài toán trở thành: đếm số đỉnh \(v_i\) sao cho \(p(v_i,n\) đúng bằng dãy đầu vào \(b_1,\ldots,b_n\).

Lời giải hiển nhiên là thử từng đỉnh và sinh \(n\) bit, có thời gian \(O(nm)\). Phần sau trình bày hai cách cải thiện.

### Từ điển các đoạn cơ sở

Với mỗi lũy thừa hai \(2^j\), trong đó \(0\le j\le N=\lfloor\log_2n\rfloor\), ta gán định danh cho các dãy nhãn dài \(2^j\), sao cho hai dãy có cùng định danh khi và chỉ khi chúng bằng nhau. Định danh là số nguyên trong đoạn \(0\) đến \(m-1\), nên có thể so sánh hai dãy trong \(O(1)\). Ký hiệu `ident[v_i, 2^j]` là định danh của \(p(v_i,2^j\).

Vì cơ sở dữ liệu không phải một xâu mà là đồ thị, ta cũng phải nhảy nhanh trên đường đi. Ký hiệu `step[v_i, l]` là đỉnh đạt được sau khi đi theo \(l\) cạnh, xuất phát từ \(v_i\). Ta tính `step` cho các \(l\) là lũy thừa hai bằng **binary lifting**.

Ta xây từ điển như sau. Với \(j=0\):

\[
\texttt{ident}[v_i,1]=b(i),\qquad \texttt{step}[v_i,1]=f(v_i).
\]

Với \(j=1,\ldots,N\), hãy gán định danh cho các dãy dài \(2^j\) từ hai nửa dài \(2^{j-1}\). Trước hết, với mỗi đỉnh \(v_i\), lập cặp định danh tạm

\[
\left(
\texttt{ident}[v_i,2^{j-1}],
\texttt{ident}[\texttt{step}[v_i,2^{j-1}],2^{j-1}]
\right).
\]

Phần tử thứ hai chính là định danh của nửa sau, bắt đầu sau \(2^{j-1}\) nhãn đầu của \(p(v_i,2^j\). Sắp xếp từ điển các cặp này; radix sort cho phép làm trong \(O(m)\). Duyệt danh sách đã sắp để thay mỗi cặp bằng một định danh nguyên duy nhất, bảo đảm các cặp giống nhau nhận cùng định danh. Đồng thời tính

\[
\texttt{step}[v_i,2^j]
=\texttt{step}[\texttt{step}[v_i,2^{j-1}],2^{j-1}].
\]

Từ điển cho phép gán định danh cho một dãy dài đúng \(n\). Định danh của \(p(v_i,n\) là cặp gồm định danh của \(2^N\) nhãn đầu và \(2^N\) nhãn cuối:

\[
\left(
\texttt{ident}[v_i,2^N],
\texttt{ident}[\texttt{step}[v_i,n-2^N],2^N]
\right).
\]

Vì \(2^N+2^N>n\), cặp này xác định duy nhất toàn bộ dãy. Giá trị `step[v_i, n-2^N]` được tính trong \(O(\log n)\): bắt đầu tại \(v_i\), rồi với mỗi bit \(2^j\) có mặt trong biểu diễn nhị phân của \(n-2^N\), nhảy sang `step[v, 2^j]`.

Để áp dụng cho xâu đầu vào, cho thêm \(n\) đỉnh \(u_1,\ldots,u_n\), trong đó \(u_i\) có nhãn \(b_i\) và cạnh đi ra tới \(u_{\min(i+1,n)}\). Tính các định danh cho cả \(m+n\) đỉnh, rồi đếm các \(v_i\) có định danh của \(p(v_i,n\) trùng với định danh của \(p(u_1,n\).

Thời gian chạy là \(O((m+n)\log n)\), nhưng nếu giữ toàn bộ bảng `ident` và `step` thì bộ nhớ cũng là \(O((m+n)\log n)\), vượt giới hạn đề bài. Ta giảm xuống \(O(m+n)\) bằng cách, khi xây từ điển, chỉ giữ hai hàng mới nhất của bảng — ứng với \(2^{j-1}\) và \(2^j\) — và tính các giá trị `step[·, n-2^N]` trực tiếp trong quá trình cần dùng.

### Automaton tìm mẫu trong cây

Ta còn có lời giải \(O(m+n)\). Trước hết, xét một mẫu cố định \(x=x_1x_2\ldots x_n\) và một văn bản \(y=y_1y_2\ldots y_m\). Ta xây automaton khớp mẫu, có \(n+1\) trạng thái \(s_0,\ldots,s_n\). Sau khi đọc \(y_1\ldots y_j\), automaton ở trạng thái \(s_i\) khi hậu tố dài nhất của đoạn đã đọc đồng thời là tiền tố của \(x\) có độ dài \(i\). Nói cách khác,

\[
y_{j-i+1}\ldots y_j=x_1\ldots x_i
\]

và không có \(i\) lớn hơn thỏa điều kiện này.

Mọi thông tin chuyển trạng thái nằm trong bảng \(\delta\): khi ở \(s_i\) và đọc ký tự \(a\), automaton chuyển sang \(\delta(s_i,a)\). Đặc biệt, với \(0\le i<n\), có \(\delta(s_i,x_{i+1})=s_{i+1}\). Khởi đầu ở \(s_0\), đọc văn bản lần lượt; mỗi khi đạt \(s_n\), ta tìm được một lần xuất hiện của mẫu (ký tự vừa đọc là ký tự cuối của lần xuất hiện ấy).

Automaton này được xây trong \(O(nA)\), với \(A\) là số ký tự khác nhau có thể xuất hiện. Đây là dạng hiện của ý tưởng Knuth–Morris–Pratt: KMP duy trì trạng thái khi chạy nhưng không dựng toàn bộ bảng chuyển. Khớp trên văn bản dài \(m\) mất \(O(m)\).

Automaton cũng tìm mẫu hiệu quả trong cây có gốc. Nếu mỗi đỉnh cây mang một ký tự, ta cần tìm mọi đường đi bắt đầu ở một đỉnh bất kỳ, đi xuống, và có nhãn ghép thành \(x\). Gán trạng thái automaton cho các đỉnh: nếu gốc mang nhãn \(a\), trạng thái của gốc là \(\delta(s_0,a)\). Đỉnh mang nhãn \(a\), có cha ở trạng thái \(s_i\), sẽ nhận trạng thái \(\delta(s_i,a)\). Số lần xuất hiện của \(x\) là số đỉnh có trạng thái \(s_n\). Thuật toán này mất \(O(nA+m)\) thời gian và bộ nhớ.

> Không nên chỉ chạy KMP trực tiếp trên cây. Dù tổng thời gian KMP trên một đường đi là tuyến tính, một lần chuyển sau khi đã khớp \(k\) ký tự có thể mất \(\Theta(k)\). Với những cây có dạng phù hợp, cùng một bước chậm có thể xảy ra tại nhiều đỉnh trên cùng một mức; tổng thời gian trên cả cây khi đó có thể là bậc hai. Vì vậy cần dựng bảng chuyển của automaton.

Quay lại bài toán. Mẫu cần tìm có độ dài \(n\), nhãn chỉ là `0` và `1`, do đó \(A=2\). Ta có thể xử lý từng thành phần liên thông yếu của đồ thị độc lập rồi cộng kết quả. Vì mỗi đỉnh có đúng một cạnh đi ra, mỗi thành phần gồm một chu trình với các cây gắn vào nó. Xét một thành phần có chu trình \(\ell\) đỉnh, mang nhãn \(y_1,y_2,\ldots,y_\ell\). Ký hiệu \(T_i\) là cây gắn vào đỉnh thứ \(i\) của chu trình; ta coi chính đỉnh chu trình là gốc của \(T_i\), nên cây có thể chỉ gồm một đỉnh.

Cố định \(T_i\). Các cạnh trong cây hướng “lên trên”, tức hướng về chu trình. Vì vậy để dùng cách khớp mẫu trong cây, ta tìm mẫu đảo

\[
x=b_n b_{n-1}\ldots b_1.
\]

Cách này tìm được các lần xuất hiện nằm hoàn toàn trong \(T_i\). Để bắt cả những lần xuất hiện bắt đầu trong cây rồi đi tiếp qua chu trình, phải khởi tạo đúng trạng thái tại gốc. Ta cần độ dài \(j\) của hậu tố dài nhất của dãy vô hạn

\[
\ldots y_\ell\ldots y_1y_\ell\ldots y_1y_\ell\ldots y_i
\]

(tức dãy nhãn chu trình lặp vô hạn, cắt ngay sau \(y_i\)) mà đồng thời là tiền tố của mẫu \(x\). Khi đó trạng thái khởi đầu ở gốc \(T_i\) là \(s_j\).

Các trạng thái khởi đầu cho mọi cây trong một chu trình được tính hiệu quả. Nếu trạng thái cho \(T_i\) là \(s_j\), thì trạng thái cho \(T_{i-1}\) là \(\delta(s_j,y_{i-1})\), với chỉ số tuần hoàn (khi \(i=1\), dùng \(y_\ell\)). Do đó chỉ cần tính trạng thái cho một cây, chẳng hạn \(T_1\).

Ta cần tìm \(j\), tức độ dài hậu tố dài nhất của dãy

\[
\ldots y_\ell\ldots y_1y_\ell\ldots y_1y_\ell\ldots y_1
\]

trùng với tiền tố của \(x\). Một cách trực tiếp là chạy automaton trên \(Y=(y_\ell\ldots y_1)^k\) với \(k\) đủ lớn, nhưng như vậy có thể quá chậm vì mỗi chu trình phải được duyệt nhiều vòng.

Trước hết chạy automaton trên hai vòng \(y_\ell\ldots y_1y_\ell\ldots y_1\), và giả sử trạng thái cuối là \(s_i\). Nếu \(i\le\ell\), ta có ngay \(j=i\). Nếu \(i>\ell\), mẫu có thể quấn quanh chu trình nhiều lần. Gọi \(C\) là số lớn nhất sao cho tiền tố dài \(C\ell\) của \(x\) khớp với chu trình; hay nói cách khác, \(x\) quấn được \(C\) vòng nhưng không quấn được \(C+1\) vòng. Chạy trên \(Y=(y_\ell\ldots y_1)^{C+1}\) sẽ kết thúc tại \(s_j\).

Khi \(C\ge2\), sau \(2\ell\) ký tự automaton ở \(s_i\). Nhờ tính tuần hoàn của tiền tố mẫu, sau \(C\ell\) ký tự trạng thái là \(s_{i+(C-2)\ell}\). Vì vậy, thay vì mô phỏng \(C+1\) vòng, ta khởi tạo trực tiếp ở trạng thái này rồi chỉ đọc thêm \(\ell\) ký tự cuối.

Để tính nhanh \(C\), dùng mảng `Pref` (còn gọi là z-array): `Pref[t]` là độ dài tiền tố dài nhất của \(x\) xuất hiện tại vị trí \(t\) trong \(x\). Mảng này tính được tuyến tính. Khi đã có nó,

\[
C=\left\lfloor\frac{\texttt{Pref}[\ell+1]}{\ell}\right\rfloor+1
\]

được suy ra trong \(O(1)\).

Tóm lại, đầu tiên xây automaton khớp mẫu đảo \(x=b_n\ldots b_1\) và mảng `Pref` trong \(O(n)\). Phân rã đồ thị thành các thành phần liên thông yếu. Trong mỗi thành phần, khởi tạo các trạng thái ở chu trình như trên, rồi duyệt các cây gắn vào chu trình để chạy automaton. Mỗi đỉnh và cạnh chỉ được xử lý một số lần hằng số, nên tổng thời gian là \(O(m+n)\), bộ nhớ là \(O(m+n)\).
