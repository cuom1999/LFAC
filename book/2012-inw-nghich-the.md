# Nghịch thế ★

**Tác giả đề:** Krzysztof Diks  
**Tác giả lời giải:** Jakub Łącki  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `inw`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2012/inw>


## Đề bài

Byteasar đã phát hiện một họ mới các đồ thị vô hướng có thể được biểu diễn bằng **nghịch thế**. Gọi

\[
V=\{1,2,\ldots,n\}
\]

là tập đỉnh của đồ thị, và gọi

\[
a_1,a_2,\ldots,a_n
\]

là một dãy gồm các số đôi một khác nhau thuộc tập \(V\). Hai đỉnh \(a_i\) và \(a_j\) được nối bởi một cạnh khi cặp \((i,j)\) là một nghịch thế của dãy, nghĩa là

\[
i<j\quad\text{và}\quad a_i>a_j.
\]

Ví dụ, với \(n=4\) và dãy \(2,3,1,4\), ta thu được đồ thị sau:

![Đồ thị nghịch thế của dãy \(2,3,1,4\).](figures/2012-inw-fig-example.png)

Các cạnh là \((2,1)\) và \((3,1)\); vì vậy hai cạnh này nối các đỉnh mang nhãn tương ứng như hình.

Byteasar muốn kiểm tra xem cách biểu diễn mình nghĩ ra có thật sự hữu ích không. Anh quyết định viết chương trình tìm mọi thành phần liên thông của đồ thị. Nhắc lại rằng hai đỉnh \(u,v\in V\) thuộc cùng một thành phần liên thông nếu tồn tại một dãy đỉnh bắt đầu ở \(u\), kết thúc ở \(v\), sao cho mỗi hai đỉnh liên tiếp trong dãy đều được nối bởi một cạnh.

Trong ví dụ trên có hai thành phần liên thông: \(\{1,2,3\}\) và \(\{4\}\).

Hãy giúp Byteasar!

### Dữ liệu vào

Dòng đầu chứa một số nguyên \(n\) (\(1\le n\le 1\,000\,000\)), là số đỉnh của đồ thị.

Dòng thứ hai chứa \(n\) số nguyên \(a_1,a_2,\ldots,a_n\).

### Dữ liệu ra

Dòng đầu tiên phải in số thành phần liên thông của đồ thị; gọi số này là \(m\).

Mỗi trong \(m\) dòng sau mô tả một thành phần liên thông. Trước hết in số \(k\), là kích thước thành phần; sau đó in dãy tăng dần gồm \(k\) số hiệu đỉnh của thành phần ấy.

Các thành phần phải được in theo thứ tự sao cho các số hiệu đỉnh đầu tiên của chúng tạo thành một dãy tăng dần. Nói cách khác, nếu \(S\) và \(S'\) là hai thành phần liên thông, \(u\in S\) và \(v\in S'\) lần lượt là các đỉnh có số hiệu nhỏ nhất của chúng, và \(u<v\), thì phải in \(S\) trước \(S'\).

### Ví dụ

**Dữ liệu vào**

```text
4
2 3 1 4
```

**Dữ liệu ra**

```text
2
3 1 2 3
1 4
```

## Lời giải

Bài *Nghịch thế* là một trong những bài dễ nhất của Giải vô địch Ba Lan năm 2012. Dù đa số các đội giải được nó khá dễ dàng, có lẽ chỉ ít thí sinh nhận ra rằng bài có một lời giải cực kỳ đơn giản, có thể cài đặt chỉ trong vài dòng. Những người khác chọn một cách tiếp cận chuẩn nhưng phức tạp hơn; ở đây chúng ta sẽ không bàn đến cách đó.

Ta phải tìm các thành phần liên thông của một đồ thị được mã hóa bởi một hoán vị của các số từ \(1\) đến \(n\). Bản thân đồ thị có thể có quá nhiều cạnh đến mức không thể lưu biểu diễn tường minh của nó trong giới hạn bộ nhớ. Vì vậy, ta phải thao tác trực tiếp trên biểu diễn đã cho trong đề.

### Thành phần chứa \(a_1\)

Trước hết, hãy xem thành phần liên thông chứa \(a_1\) trông như thế nào. Nếu \(a_1=1\), đỉnh \(1\) tự tạo thành một thành phần một đỉnh: ở bên phải của \(a_1\) không có phần tử nào nhỏ hơn nó, nên không có cạnh nào đi ra từ đỉnh \(1\).

Nếu \(a_1>1\) thì sao? Xét biểu diễn sau với \(n=10\):

```text
4   1   8   2   7   3   5   6   10   9
```

Ta sẽ đánh dấu những phần tử mà ta biết là thuộc thành phần liên thông của đỉnh \(a_1\). Vì \(a_1=4\), các đỉnh \(1,2,3\) đều nối trực tiếp với \(4\): chúng nhỏ hơn \(4\) và xuất hiện ở bên phải của \(4\). Vậy chúng nằm trong cùng thành phần:

```text
[4] [1]  8  [2]  7  [3]  5  6  10  9
```

Lúc này thành phần chứa \(1,2,3,4\), tức là mọi đỉnh có nhãn từ \(1\) đến \(a_1\). Tuy nhiên, đó không phải là bốn phần tử đầu của dãy: giữa \(1\) và \(2\) có đỉnh \(8\), giữa \(2\) và \(3\) có đỉnh \(7\). Hai đỉnh này cũng thuộc thành phần của \(a_1\): chúng có nhãn lớn hơn các đỉnh đã thêm trước đó, và ở bên phải chúng có ít nhất một đỉnh đã thuộc thành phần.

```text
[4] [1] [8] [2] [7] [3]  5  6  10  9
```

Sau khi thêm \(7\) và \(8\), thành phần đã chứa đỉnh \(8\). Vì thế mọi đỉnh ở bên phải có nhãn nhỏ hơn \(8\) cũng phải thuộc thành phần; trong ví dụ là \(5\) và \(6\):

```text
[4] [1] [8] [2] [7] [3] [5] [6]  10  9
```

Sau bước này, thành phần chứa mọi đỉnh có nhãn từ \(1\) đến \(8\), đồng thời chúng chính là tám phần tử đầu của dãy \(a_1,\ldots,a_{10}\). Dễ thấy không có cạnh nào từ thành phần này sang đỉnh bên ngoài. Một cạnh như vậy phải kết thúc ở một đỉnh nằm bên phải các đỉnh của thành phần, với nhãn nhỏ hơn \(8\). Nhưng tất cả các đỉnh có nhãn nhỏ hơn \(8\) đã thuộc thành phần rồi.

Tổng quát hơn, để xác định thành phần chứa \(a_1\), ta áp dụng luân phiên hai quy tắc sau:

1. Nếu đỉnh \(m\) thuộc thành phần thì các đỉnh \(1,\ldots,m-1\) cũng thuộc thành phần.
2. Nếu đỉnh \(a_k\) thuộc thành phần thì các đỉnh \(a_1,\ldots,a_{k-1}\) cũng thuộc thành phần.

Việc chứng minh hai tính chất này là một bài tập bổ ích. Có thể trước hết chứng minh quy tắc thứ hai, rồi giả sử thành phần đang xét gồm \(k\) phần tử đầu của dãy, từ đó chứng minh quy tắc thứ nhất. Lưu ý rằng các quy tắc này chỉ đúng khi ta đang tìm thành phần chứa đỉnh \(a_1\).

Khi không quy tắc nào còn làm thành phần liên thông lớn thêm, ta đã biết chính xác nội dung cuối cùng của nó. Thật vậy, quy tắc 2 cho thấy thành phần chứa một số lượng phần tử đầu của dãy; quy tắc 1 cho thấy các phần tử ấy chính là mọi số từ \(1\) đến một số \(m\). Do đó thành phần chứa đúng \(m\) phần tử đầu của dãy \(a_1,\ldots,a_n\).

### Thuật toán

Làm sao khai thác nhận xét trên để có lời giải hiệu quả? \(m\) phần tử đầu của dãy chỉ có thể tạo thành một thành phần liên thông nếu tập các phần tử đó là

\[
\{1,\ldots,m\}.
\]

Để kiểm tra điều kiện này, dùng một tính chất rất đơn giản: với bất kỳ dãy gồm \(m\) số nguyên dương đôi một khác nhau, các phần tử của nó tạo thành tập \(\{1,\ldots,m\}\) khi và chỉ khi phần tử lớn nhất bằng \(m\).

Vì vậy ta có thể phát hiện thời điểm \(m\) phần tử đầu tiên tạo thành \(\{1,\ldots,m\}\). Hơn nữa, ngay khi tìm được \(m\) nhỏ nhất như vậy, ta thật sự đã tìm được một thành phần liên thông: không có cạnh nào đi ra khỏi nó.

Thuật toán vì thế cực kỳ đơn giản. Duyệt dãy từ trái sang phải và duy trì giá trị lớn nhất `prefix_max` trong tiền tố hiện tại. Vì \(a\) là một hoán vị của \(1,\ldots,n\), tiền tố \(a_1,\ldots,a_i\) chứa đúng tập \(\{1,\ldots,i\}\) khi và chỉ khi `prefix_max == i`. Mỗi vị trí \(i\) thỏa điều kiện này là điểm kết thúc của một thành phần liên thông.

Nếu thành phần trước kết thúc tại \(s-1\), thành phần mới chứa đúng các nhãn liên tiếp \(s,s+1,\ldots,i\). Vì định dạng đầu ra yêu cầu số thành phần trước, ta lưu mỗi thành phần bằng cặp đầu mút \((s,i)\), rồi in toàn bộ sau khi quét xong.

Một dạng giả mã trực tiếp là:

```pseudocode
components = empty list
start = 1
prefix_max = 0

for end = 1..n:
    prefix_max = max(prefix_max, a[end])
    if prefix_max == end:
        components.append((start, end))
        start = end + 1

print components.size
for (first, last) in components:
    size = last - first + 1
    print size followed by first, first+1, ..., last
```

Ta phải lưu các khoảng thành phần trước khi in, vì định dạng đầu ra yêu cầu số thành phần xuất hiện ở dòng đầu. Mỗi cặp `(first, last)` biểu diễn toàn bộ các nhãn nguyên liên tiếp trong một thành phần, nên không cần lưu riêng từng đỉnh. Các thành phần được lưu và in theo đúng thứ tự yêu cầu, vì thành phần tiếp theo luôn có các nhãn lớn hơn toàn bộ nhãn của những thành phần trước.

Mỗi phần tử đầu vào chỉ được xem một lần, nên thuật toán chạy trong thời gian tuyến tính \(O(n)\). Danh sách các khoảng dùng \(O(c)\) bộ nhớ, với \(c\) là số thành phần liên thông và \(c\le n\). Nếu mảng đầu vào đã nằm trong bộ nhớ, cũng có thể tránh danh sách này bằng hai lượt quét: lượt đầu đếm thành phần, in số đếm, rồi lượt thứ hai in các thành phần.
