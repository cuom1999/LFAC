# Công thức 1 ★★★★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Tomasz Idziaszek  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `for`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2012/for>


## Đề bài

Cậu bé Bytie rất thích xem các cuộc đua Công thức 1 hằng năm trên đường đua nối giữa Bytetown và Byteburg. Những khoảnh khắc hào hứng nhất đối với cậu là các pha vượt xe; cậu muốn được xem càng nhiều pha vượt càng tốt.

Bytie mơ về một cuộc đua có (n) xe Công thức 1. Với mỗi (i) ((1\le i\le n)), chiếc xe xuất phát ở vị trí thứ (i) phải thực hiện đúng \(a_i\) lần vượt trong cuộc đua. Để đơn giản, tại mỗi thời điểm nhiều nhất chỉ có một pha vượt, với đúng hai xe tham gia: một xe vượt chiếc xe **ngay phía trước** nó.

Hãy xác định liệu một cuộc đua như vậy có thể diễn ra hay không.

### Dữ liệu vào

Dòng đầu chứa số nguyên (t), là số bộ dữ liệu kiểm tra.

Mỗi bộ dữ liệu gồm hai dòng:

- Dòng đầu chứa số nguyên (n) ((1\le n\le1\,000\,000)), số xe tham gia.
- Dòng tiếp theo chứa (n) số nguyên \(a_1,a_2,\ldots,a_n\) (\(0\le a_i\le10^9\)); \(a_i\) là số lần vượt mà xe xuất phát thứ (i) phải thực hiện.

Tổng kích thước của một tệp dữ liệu vào không vượt quá (20\) MB.

### Dữ liệu ra

In (t) dòng, mỗi dòng ứng với một bộ dữ liệu. In `TAK` nếu có thể tổ chức cuộc đua đã cho, và `NIE` nếu không thể.

### Ví dụ

Với dữ liệu vào:

```text
3
2
0 1
3
0 1 4
3
1 1 3
```

kết quả đúng là:

```text
TAK
NIE
TAK
```

## Lời giải

### Số lần vượt tối đa của một xe

Cố định một xe (k). Giả sử mọi xe khác đều phải thực hiện đúng số lần vượt đã cho trong đầu vào. Ký hiệu \(s_k\) là **số lần vượt lớn nhất** mà xe (k) có thể thực hiện trong một cuộc đua thỏa giả thiết đó.

Trước hết xét xe cuối cùng, xe (n). Nó có thể lần lượt vượt tất cả (n-1) xe đứng trước, nên có ngay (n-1) lần vượt. Sau khi vượt xe (i), hai xe có thể thay phiên vượt nhau thêm \(a_i\) cặp thao tác theo thứ tự

\[
i\text{ vượt }n,\quad n\text{ vượt }i.
\]

Việc này cho xe (n) thêm \(a_i\) lần vượt, đồng thời dùng hết toàn bộ \(a_i\) lần vượt bắt buộc của xe (i). Đây là chiến lược tốt nhất, vì thế

\[
s_n=\sum_{i=1}^{n-1}(a_i+1).
\]

Với xe (k\ne n), việc vượt các xe xuất phát trước nó hoàn toàn tương tự. Nhưng để vượt một xe xuất phát sau nó, xe đó phải vượt xe (k) trước; điều này không phải lúc nào cũng làm được. Ta tách

\[
s_k=A_k+B_k,
\]

trong đó \(A_k\) chỉ phụ thuộc vào các xe đứng trước (k), còn \(B_k\) chỉ phụ thuộc vào các xe đứng sau (k). Phần thứ nhất là

\[
A_k=\sum_{i=1}^{k-1}(a_i+1).
\]

Để tính phần thứ hai, với (i>k), đặt \(b_{k,i}\) là số lần vượt **ít nhất** mà xe (i) phải làm để đứng ngay sau xe (k), nếu mọi xe ở giữa sẽ vượt xe (k) khi chúng còn có thể làm vậy. Ta có

\[
b_{k,k+1}=0,
\qquad
b_{k,i+1}=b_{k,i}+[a_i-b_{k,i}\le0]\quad(i>k).
\]

Ở đây ([P]) là ngoặc Iverson: bằng (1) nếu mệnh đề (P) đúng, và bằng (0) nếu sai. Quả vậy, xe (k+1) vốn đã ở ngay sau xe (k). Để xe (i+1) đứng ngay sau (k), trước hết nó cần làm số lần vượt tương ứng với xe (i); ngoài ra, nó phải vượt xe (i) thêm một lần nếu xe (i) không còn đủ lượt để tự vượt xe (k).

Mỗi xe đã đến ngay sau xe (k) có thể dùng các lượt vượt còn lại để luân phiên vượt với xe (k). Do đó

\[
B_k=\sum_{i=k+1}^{n}\max(0,a_i-b_{k,i}).
\]

Các công thức này tính được một giá trị \(s_k\) trong (O(n)) thời gian.

### Điều kiện cần và xe tới hạn

Điều kiện cần hiển nhiên để có lời giải là mỗi xe phải có thể thực hiện đủ số lượt được yêu cầu:

\[
s_k\ge a_k\qquad\text{với mọi }1\le k\le n. \tag{1}
\]

Điều đáng chú ý là điều kiện này cũng là **đủ**; chứng minh sẽ được đưa ra sau. Trước hết, hãy kiểm tra nó nhanh.

Nếu tính trực tiếp mọi \(B_k\), độ phức tạp sẽ là (O\(n^2\)). Ta có thể quan sát rằng \(A_k\) tính được cho mọi (k) trong (O(n)). Bất cứ xe nào đã thỏa \(A_k\ge a_k\) đều tự động thỏa (1), không cần tính \(B_k\). Những xe còn lại có \(a_k>A_k\); do \(A_k\) lớn hơn tổng các \(a_i\) trước nó ít nhất (k-1), các giá trị \(a_k\) tại những vị trí này tăng theo cấp số nhân. Vì vậy chỉ có (O\(\log\max_i a_i\)) xe cần tính \(B_k\), dẫn đến một cách làm (O\(n\log\max_i a_i\)).

Ta còn có thể làm tốt hơn nữa. Gọi (m) là **vị trí cuối cùng** sao cho

\[
a_m\ge A_m.
\]

Xe \(m\) được gọi là *xe tới hạn*. Nó hoặc dùng hết mọi lượt vượt của các xe xuất phát trước nó, hoặc bắt buộc phải bị một xe xuất phát sau nó vượt. Hóa ra (1) chỉ có thể sai tại xe tới hạn. Vì thế toàn bộ điều kiện (1) tương đương đúng với một bất đẳng thức duy nhất:

\[
s_m\ge a_m. \tag{2}
\]

Thật vậy, xét một \(k\ne m\).

- Nếu \(k>m\), từ tính cuối cùng của \(m\) ta có \(a_k<A_k\), nên

\[
s_k=A_k+B_k\ge A_k>a_k.
\]

- Nếu \(k<m\), do \(a_m\ge A_m\ge a_k+m-1\), và luôn có \(b_{k,m}\le m-2\), nên

\[
\begin{aligned}
s_k&\ge B_k\\
   &\ge\max(0,a_m-b_{k,m})\\
   &\ge\max(0,(a_k+m-1)-(m-2))>a_k.
\end{aligned} \tag{3}
\]

Do đó chỉ cần tìm \(m\), rồi tính \(s_m\) bằng các công thức của phần trước. Cả hai bước đều là một lần duyệt, nên thuật toán chạy trong \(O(n)\) thời gian.

### Thuật toán quyết định

Với mỗi bộ kiểm tra:

1. Duyệt từ trái sang phải, duy trì \(A_i\), và lưu vị trí cuối cùng \(m\) thỏa \(a_m\ge A_m\). Sau đó \(m\) là xe tới hạn.
2. Ta đã có \(A_m\). Duyệt các xe \(i=m+1,\ldots,n\), duy trì \(b=b_{m,i}\), và cộng
   \(\max(0,a_i-b)\) vào \(B_m\). Sau khi xét xe \(i\), cập nhật
   \(b\leftarrow b+[a_i-b\le0]\).
3. In `TAK` khi \(A_m+B_m\ge a_m\); ngược lại in `NIE`.

Các tổng có thể đạt cỡ \(n(10^9+1)\), vì vậy cần dùng kiểu số nguyên 64 bit.

### Chứng minh tính đúng đắn

Phần còn lại chứng minh rằng (1) là điều kiện đủ. Chứng minh có tính xây dựng: nó chỉ ra thứ tự các pha vượt.

Với một dãy yêu cầu hiện tại \(a_1,\ldots,a_n\) đang thỏa (1), xác định xe tới hạn (m). Luôn thực hiện lượt vượt bằng **xe đầu tiên còn lượt vượt và đang ở sau xe tới hạn**. Nếu không có xe nào như vậy, cho chính xe tới hạn vượt. Sau mỗi lượt, số lượt còn phải thực hiện của xe đã vượt giảm đi một, và thứ tự hai xe kề nhau hoán đổi. Xe tới hạn có thể thay đổi trong quá trình này.

Ta sẽ chứng minh rằng một lượt theo quy tắc trên luôn tạo ra một dãy mới \(a'_1,\ldots,a'_n\) vẫn thỏa (1). Khi ấy lặp lại quy tắc sẽ giảm tổng \(\sum_i a_i\) từng đơn vị, nên cuối cùng đạt dãy toàn (0), tức là dựng được toàn bộ cuộc đua.

#### Trường hợp 1: phía sau xe tới hạn không còn lượt nào

Giả sử \(a_i=0\) với mọi (i>m), bao gồm cả trường hợp (m=n). Khi đó \(B_m=0\). Mặt khác, do (m) tới hạn và (1) đúng,

\[
A_m=s_m-B_m=s_m\ge a_m\ge A_m.
\]

Suy ra \(a_m=A_m\). Xe (m) có thể dùng đúng chiến lược đã mô tả ở đầu lời giải: lần lượt vượt mọi xe phía trước, và với xe (i) thực hiện chuỗi luân phiên gồm \(a_i\) lượt của xe (i) rồi xe (m). Vì vậy tồn tại cách hoàn tất phần đua còn lại sau khi xe (m) thực hiện lượt vượt đầu tiên. Do (1) là điều kiện cần, dãy sau lượt đầu tiên vẫn phải thỏa (1).

#### Trường hợp 2: có xe phía sau còn lượt vượt

Gọi (j>m) là chỉ số nhỏ nhất sao cho \(a_j>0\). Theo quy tắc, xe (j) sẽ vượt. Sau phép vượt, trong dãy theo thứ tự trên đường đua, hai giá trị kề nhau đổi chỗ và giá trị của xe (j) giảm một:

\[
a'_i=a_i\ (i\notin\{j-1,j\}),\qquad
a'_{j-1}=a_j-1,\qquad a'_j=a_{j-1}.
\]

Với mọi (i>j), ta có \(A'_i=A_i-1\). Vì (i>m), định nghĩa xe tới hạn cho \(A_i>a_i\), nên

\[
s'_i=A'_i+B'_i\ge A'_i=A_i-1\ge a_i=a'_i. \tag{4}
\]

Vậy chỉ còn phải xét các xe không ở sau (j). Có hai khả năng.

##### Trường hợp 2A: xe (j) không vượt xe tới hạn

Điều này nghĩa là giữa (m) và (j) có ít nhất một xe. Trước và sau lượt vượt, đoạn liên quan có dạng

```text
a1 ... am  0 0 ... 0  aj aj+1 ... an
                       ↓
a1 ... am  0 0 ... aj-1 0  aj+1 ... an
```

Vì \(A_j>a_j\), ta có

\[
s'_{j-1}=A'_{j-1}+B'_{j-1}\ge A'_{j-1}=A_j-1>a_j-1=a'_{j-1}.
\]

Kết hợp với (4), và với việc mọi xe có chỉ số lớn hơn (m) nhưng giá trị bằng (0) đương nhiên thỏa (1), điều kiện đúng cho mọi xe sau (m).

Nếu (i\le m), khi tính \(B_i\), xe (j) dù sao cũng phải vượt toàn bộ các xe từ (i+1) đến (m); lượt vừa thực hiện không thay đổi điều đó cũng như không thay đổi phần phía sau (j). Do đó \(B'_i=B_i\), đồng thời \(A'_i=A_i\). Suy ra

\[
s'_i=A'_i+B'_i=A_i+B_i=s_i\ge a_i=a'_i.
\]

#### Trường hợp 2B: xe (j) vượt xe tới hạn

Khi đó (j=m+1), và phép vượt biến đổi đoạn liên quan như sau:

```text
a1 ... a(m-1)  am  a(m+1) a(m+2) ... an
                         ↓
a1 ... a(m-1) a(m+1)-1  am  a(m+2) ... an
```

Bất đẳng thức (4) đã xử lý mọi (i>m+1). Với (i<m), ta có

\[
a'_{m+1}=a_m\ge A_m\ge a_i+m-1=a'_i+m-1.
\]

Áp dụng đúng lập luận của (3) cho xe (m+1), suy ra \(s'_i\ge a'_i\).

Do (m) là xe tới hạn cuối cùng,

\[
a_{m+1}<A_{m+1}=A_m+(a_m+1).
\]

Vì thế, với chỉ số (m),

\[
s'_m\ge A'_m+a'_{m+1}=A_m+a_m\ge a_{m+1}>a_{m+1}-1=a'_m.
\]

Cuối cùng, vì các giá trị sau (m+1) không đổi nên \(B'_{m+1}=B_{m+1}\). Ngoài ra, \(b_{m,m+1}=0\), \(a_{m+1}>0\), nên \(b_{m,m+2}=0=b_{m+1,m+2}\), và do đó

\[
B_m=a_{m+1}+B_{m+1}.
\]

Suy ra

\[
\begin{aligned}
s'_{m+1}
 &=A'_m+(a'_m+1)+B'_{m+1}\\
 &=A_m+a_{m+1}+B_{m+1}\\
 &=A_m+B_m=s_m\\
 &\ge a_m=a'_{m+1}.
\end{aligned}
\]

Vậy trong mọi trường hợp, một lượt đi theo quy tắc vẫn giữ (1). Quy nạp theo tổng số lượt còn lại cho thấy nếu (1) đúng thì ta luôn dựng được cuộc đua hợp lệ. Kết hợp với tính cần thiết đã nêu, thuật toán in `TAK` khi và chỉ khi đáp án là có.

### Độ phức tạp

Mỗi bộ kiểm tra được duyệt một số lần hằng số. Thời gian là (O(n)); bộ nhớ phụ là (O(n)) nếu lưu mảng (a) để thực hiện lượt duyệt thứ hai, hoặc (O(n-m)) nếu chỉ lưu đoạn hậu tố cần thiết. Trong thực tế, (O(n)) số nguyên 64 bit vẫn phù hợp giới hạn bộ nhớ.
