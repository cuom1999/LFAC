# Tính giá trị biểu thức ★★★★

**Tác giả đề:** Jakub Radoszewski  
**Tác giả lời giải:** Jakub Radoszewski  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `ewa`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2012/ewa>


## Đề bài

Xét một biểu thức (E) chứa các hằng số nguyên từ (0) đến (9), các biến từ `a` đến `z`, và ba phép toán: cộng, nhân, và lũy thừa với số mũ là hằng số. Điều đáng chú ý là mỗi biến `a`, `b`, …, `z` xuất hiện trong biểu thức (E) **nhiều nhất một lần**.

Với một số nguyên tố (p), hãy cho biết đa thức được biểu diễn bởi (E) có bao nhiêu nghiệm modulo (p). Nói cách khác, cần đếm số cách gán cho các biến xuất hiện trong (E) những số nguyên từ (0) đến (p-1), sao cho giá trị của (E) chia hết cho (p). Số nghiệm có thể rất lớn, vì vậy chỉ cần in phần dư của nó khi chia cho (30\,011).

Ví dụ, đa thức được biểu diễn bởi

\[
E=((a+y)\cdot(z+8))^2
\]

có (15) nghiệm modulo (p=3), trong đó có các nghiệm

\[
(a=0,y=0,z=0),\qquad (a=1,y=2,z=0),\qquad (a=2,y=0,z=1).
\]

Về hình thức, biểu thức được định nghĩa đệ quy như sau:

- Mỗi hằng số nguyên `0`, `1`, …, `9` là một biểu thức.
- Mỗi biến `a`, `b`, …, `z` là một biểu thức.
- Nếu (A) và (B) là các biểu thức, thì `(A+B)` và `(A*B)` cũng là các biểu thức, lần lượt biểu diễn tổng và tích của (A,B).
- Nếu (A) là biểu thức và (B) là hằng số nguyên từ (2) đến (9), thì `\(A^B\)` cũng là một biểu thức, biểu diễn (A) mũ (B).

### Dữ liệu vào

Dòng đầu chứa một số nguyên tố (p) ((2\le p<15\,000)).

Dòng thứ hai chứa một biểu thức (E) đúng theo đặc tả trên. Biểu thức là một chuỗi dài không quá (300) ký tự thuộc tập `0`–`9`, `a`–`z`, `+`, `*`, `^`, `(`, `)`; chuỗi không chứa khoảng trắng.

### Dữ liệu ra

Gọi (k) là số nghiệm modulo (p) của đa thức (E). In một số nguyên không âm là phần dư của (k) khi chia cho (30\,011).

### Ví dụ

**Dữ liệu vào**

```text
3
(((a+y)*(z+8))^2)
```

**Dữ liệu ra**

```text
15
```

## Lời giải

Thoạt nhìn, đây có vẻ là một bài toán thuần túy toán học. Thực ra lời giải chủ yếu dựa trên các ý tưởng thuật toán. Điều kiện mỗi biến chỉ xuất hiện nhiều nhất một lần là gợi ý quan trọng: trong toán học, một hạn chế kiểu này ít gặp; trong xử lý biểu thức bằng máy tính, nó giúp các phần con trở nên độc lập.

### Phân tích cú pháp và cây biểu thức

Trước hết, chuyển chuỗi đầu vào thành **cây biểu thức**. Lá biểu diễn hằng số hoặc biến; nút trong biểu diễn phép cộng, nhân, hoặc lũy thừa. Chẳng hạn, với biểu thức ví dụ, cây có dạng:

![Cây của biểu thức \(E=((a+y)\cdot(z+8))^2\).](figures/2012-ewa-fig-1.png)

Việc chuyển văn bản thành một biểu diễn cấu trúc như vậy thường được gọi là *parsing* (phân tích cú pháp). Trong bài này, nó đặc biệt đơn giản vì:

1. mỗi hằng số và mỗi biến chỉ chiếm đúng một ký tự;
2. mọi biểu thức biểu diễn một phép toán đều được bao bởi một cặp ngoặc.

Ta dùng một hàm đệ quy nhận vị trí ký tự đầu tiên của một biểu thức con và trả về vị trí ký tự cuối cùng của nó, đồng thời xây dựng nút gốc của cây con đó.

- Nếu ký tự đầu là một chữ cái hoặc chữ số, biểu thức con chỉ gồm ký tự ấy; tạo một lá và trả về chính vị trí đó.
- Ngược lại, ký tự đầu là `(`. Gọi đệ quy để xây cây con trái bắt đầu ngay sau dấu ngoặc mở. Ký tự ngay sau phần mô tả cây con trái là toán tử của nút hiện tại. Sau đó gọi đệ quy để xây cây con phải, bắt đầu ngay sau toán tử. Cuối cùng, ký tự sau cây con phải chính là dấu `)` đóng, và vị trí này được trả về.

Mỗi ký tự chỉ được xử lý số lần hằng số, nên quá trình này mất thời gian tuyến tính theo độ dài biểu thức. Cây thu được cũng có kích thước tuyến tính.

### Quy hoạch động trên cây

Khi đã có cây biểu thức, bài toán tự nhiên tách thành những bài toán con ứng với các cây con. Đây là lúc điều kiện không lặp biến được dùng một cách quyết định: hai cây con rời nhau chứa hai tập biến rời nhau, do đó các phép gán biến cho chúng độc lập.

Chỉ lưu số nghiệm của mỗi cây con là chưa đủ. Với mỗi nút \(u\), ta lưu mảng

\[
t_u[0],t_u[1],\ldots,t_u[p-1],
\]

trong đó \(t_u[k]\) là số phép gán cho các biến xuất hiện trong cây con tại \(u\) khiến giá trị cây con đồng dư \(k\pmod p\). Mọi phần tử mảng được tính modulo

\[
q=30\,011.
\]

#### Các trường hợp cơ sở

- Nếu \(u\) là lá mang hằng số \(c\in\{0,\ldots,9\}\), đặt \(c'=c\bmod p\). Khi đó

\[
t_u[c']=1,\qquad t_u[k]=0\quad(k\ne c').
\]

- Nếu \(u\) là một biến, thì

\[
t_u[k]=1\qquad(0\le k<p),
\]

vì biến đó có đúng một cách nhận mỗi giá trị \(k\) modulo \(p\).

#### Các phép toán

Giả sử \(u\) có hai con \(v,w\).

Với phép cộng, ta có

\[
t_u[k]=\sum_{i+j\equiv k\pmod p}t_v[i]t_w[j].
\tag{1}
\]

Với phép nhân, ta có

\[
t_u[k]=\sum_{i\cdot j\equiv k\pmod p}t_v[i]t_w[j].
\tag{2}
\]

Nếu \(u\) là nút lũy thừa, có con \(v\) và số mũ \(b\in\{2,\ldots,9\}\), thì

\[
t_u[k]=\sum_{i^b\equiv k\pmod p}t_v[i].
\tag{3}
\]

**Vì sao các công thức đúng?** Xét (1). Để tổng hai biểu thức có phần dư \(k\), phần dư của chúng phải là một cặp \((i,j)\) thỏa \(i+j\equiv k\pmod p\). Có \(t_v[i]\) cách gán biến ở cây trái cho phần dư \(i\), và \(t_w[j]\) cách ở cây phải cho phần dư \(j\). Hai lựa chọn có thể ghép tự do vì hai cây không dùng chung biến, nên có đúng \(t_v[i]t_w[j]\) cách. Cộng trên mọi cặp phù hợp cho (1). Lập luận y hệt cho (2); còn (3) chỉ gom tất cả phần dư \(i\) mà khi nâng lên mũ \(b\) cho ra \(k\).

Sau khi tính xong nút gốc \(r\), đáp án là \(t_r[0]\).

### Vì sao cách trực tiếp chưa đủ nhanh?

Gọi \(n\) là số nút của cây. Tổng kích thước mọi mảng \(t_u\) là \(O(np)\). Các lá và các nút lũy thừa đều xử lý được trong \(O(p)\): với lũy thừa, duyệt từng \(i\), tính \(k=i^b\bmod p\), rồi cộng \(t_v[i]\) vào \(t_u[k]\).

Nếu thực hiện (1) và (2) trực tiếp, mỗi nút cộng hoặc nhân tốn \(O(p^2)\). Với phép cộng, với mỗi \(k\) và \(i\), chỉ cần lấy \(j=(k-i)\bmod p\). Với phép nhân và \(i\ne0\), có thể lấy \(j=k i^{-1}\bmod p\), vì mọi phần dư khác 0 modulo số nguyên tố đều có nghịch đảo. Dù vậy, độ phức tạp tệ nhất vẫn là

\[
O(np^2),
\]

quá lớn khi \(p\) gần \(15\,000\).

Ta cần tăng tốc hai phép tích chập này bằng FFT.

### FFT cho nút cộng

FFT cho phép tính các hệ số của tích hai đa thức bậc nhỏ hơn \(m\) trong \(O(m\log m)\). Các giá trị trung gian trong FFT không nhất thiết là số nguyên; ở đây cần dùng kiểu thực có khoảng 63 bit chính xác, chẳng hạn `long double` trong GCC. Thật vậy, trong bài này \(m<p\), còn các hệ số đầu vào không vượt \(q\), nên hệ số kết quả nhiều nhất cùng bậc với \(m\max a_i\max b_i\), vẫn nằm trong phạm vi có thể làm tròn chính xác với độ chính xác này.

Xét một nút cộng \(u\), và lập hai đa thức

\[
A(x)=\sum_{i=0}^{p-1}t_v[i]x^i,
\qquad
B(x)=\sum_{i=0}^{p-1}t_w[i]x^i.
\]

Tích của chúng là

\[
C(x)=A(x)B(x)=\sum_{i=0}^{2p-2}c[i]x^i.
\]

Mỗi tích \(t_v[i]x^i\cdot t_w[j]x^j\) đóng góp vào hệ số \(c[i+j]\). Nếu \(i+j\equiv k\pmod p\), thì \(i+j\) chỉ có thể là \(k\) hoặc \(k+p\). Do đó, sau một phép nhân đa thức bằng FFT,

\[
t_u[k]=c[k]+c[k+p],
\tag{4}
\]

trong đó có thể xem hệ số ngoài phạm vi của \(C\) là 0. Nút cộng được xử lý trong \(O(p\log p)\).

### Biến phép nhân thành phép cộng bằng generator

Phép nhân tưởng chừng khác hẳn, nhưng có thể chuyển về dạng tương tự. Ta dùng một kết quả chuẩn của lý thuyết số.

**Bổ đề.** Với mọi số nguyên tố \(p\), tồn tại số nguyên dương \(g\) sao cho mỗi phần dư khác 0 modulo \(p\) được biểu diễn duy nhất dưới dạng

\[
g^i\bmod p\qquad\text{với }i\in\{0,1,\ldots,p-2\}.
\]

Số \(g\) được gọi là một **generator modulo \(p\)** (hay căn nguyên thủy modulo \(p\)).

Xét (2) trước hết với \(k>0\); khi đó cả \(i,j\) trong mọi cặp đóng góp cũng khác 0. Viết

\[
i\equiv g^{i'}\pmod p,\qquad
j\equiv g^{j'}\pmod p,qquad
k\equiv g^{k'}\pmod p.
\]

Điều kiện \(ij\equiv k\pmod p\) trở thành

\[
g^{i'+j'}\equiv g^{k'}\pmod p,
\]

tức là, nhờ tính duy nhất của biểu diễn theo generator,

\[
i'+j'\equiv k'\pmod {p-1}.
\]

Đổi chỉ số mảng theo

\[
t'_u[x]=t_u[g^x\bmod p]
\]

(tương tự với \(v,w\)). Ta nhận được

\[
t'_u[k']=
\sum_{i'+j'\equiv k'\pmod{p-1}}
t'_v[i']t'_w[j'].
\tag{5}
\]

Đây chính là công thức của nút cộng, chỉ khác là modulo \(p-1\) thay vì modulo \(p\). Vì vậy, một phép FFT nữa cho phép tính toàn bộ \(t'_u[k']\) trong \(O(p\log p)\), và từ đó suy ra mọi \(t_u[k]\) với \(k>0\).

Trường hợp \(k=0\) có thể xử lý riêng trong \(O(p)\). Tích bằng 0 khi ít nhất một thừa số bằng 0, nên chẳng hạn dùng trực tiếp

\[
t_u[0]=t_v[0]\sum_{j=0}^{p-1}t_w[j]
+t_w[0]\sum_{i=1}^{p-1}t_v[i]
\pmod q.
\]

Công thức này đếm mỗi cặp có thừa số trái bằng 0, rồi thêm các cặp có thừa số phải bằng 0 nhưng thừa số trái khác 0, nên không đếm đôi cặp \((0,0)\).

### Tìm generator

Trong các giới hạn bài này, không cần thuật toán lý thuyết số tinh vi để tìm \(g\). Thử lần lượt các ứng viên \(2,3,\ldots\). Với mỗi ứng viên \(x\), tính các lũy thừa liên tiếp

\[
x^0,x^1,\ldots,x^{p-2}\pmod p
\]

và dùng mảng đánh dấu để kiểm tra xem có phần dư nào lặp trước khi đạt mũ \(p-1\) hay không. Nếu không lặp, \(x\) là generator.

Phương pháp vét cạn này có chặn tệ nhất \(O(p^2)\), nhưng trên thực tế rất nhanh nếu dừng ngay ở generator đầu tiên. Nó chỉ thực hiện một lần, không phải cho từng nút của cây.

### Chứng minh tính đúng đắn

Ta chứng minh bằng quy nạp theo cây rằng sau khi xử lý mỗi nút \(u\), mảng \(t_u\) lưu đúng số phép gán tạo ra từng phần dư modulo \(p\).

- Với lá hằng và lá biến, điều này đúng trực tiếp theo định nghĩa các mảng ở phần cơ sở.
- Giả sử điều đó đúng với các cây con của một nút cộng hoặc nhân. Các tập biến của hai cây con rời nhau, do mỗi biến toàn cục chỉ xuất hiện một lần. Vì thế mỗi cặp phép gán con ghép thành đúng một phép gán cho nút cha. Phân hoạch các cặp theo phần dư của hai giá trị cho đúng các công thức (1) và (2), nên mảng ở nút cha cũng đúng.
- Với nút lũy thừa, mỗi phép gán cho cây con cho một phần dư \(i\), sau đó xác định duy nhất phần dư \(i^b\bmod p\) của nút cha. Gom các phép gán cùng cho ra \(k\) chính là (3).

Phép FFT không làm thay đổi công thức cần tính: (4) chỉ nhóm các cặp chỉ số có tổng bằng \(k\) hoặc \(k+p\), đúng bằng điều kiện tổng đồng dư \(k\) modulo \(p\). Tương tự, generator tạo song ánh giữa các phần dư khác 0 và các số mũ modulo \(p-1\); vì \(g^{i'}g^{j'}=g^{i'+j'}\), (5) nhóm chính xác những cặp có tích đồng dư với phần dư cần xét. Trường hợp 0 đã được tính riêng. Vậy mọi mảng đều được tính đúng, và \(t_r[0]\) tại nút gốc là số phép gán khiến \(E\equiv0\pmod p\), tức đáp án yêu cầu.

### Độ phức tạp

Tạo cây tốn \(O(|E|)\) thời gian và bộ nhớ. Với \(n\) nút của cây, mọi mảng quy hoạch động chiếm tổng cộng \(O(np)\) bộ nhớ. Mỗi lá hoặc nút lũy thừa tốn \(O(p)\); mỗi nút cộng hoặc nhân tốn \(O(p\log p)\) nhờ FFT. Do đó thời gian tổng là

\[
O(np\log p),
\]

cộng thêm thời gian một lần để tìm generator (tệ nhất \(O(p^2)\)). Bộ nhớ dùng cho lời giải là \(O(np)\), ngoài bộ đệm \(O(p)\) phục vụ FFT.
