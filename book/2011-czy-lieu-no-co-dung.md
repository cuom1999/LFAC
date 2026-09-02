# Liệu nó có dừng?

**Tác giả đề:** Jakub Łącki  
**Tác giả lời giải:** Jakub Łącki  
**Giới hạn bộ nhớ:** 64 MB  
**Mã bài:** `czy`  
**Nguồn:** [AMPPZ 2011](https://oi.edu.pl/en/archive/amppz/2011/czy)

> Bản dịch dựa trên bản tiếng Anh, các trang in 16–18 (trang PDF vật lý 30–32), của *Looking for a Challenge 2*.

## Đề bài

Bajtazar đang đi dạo quanh thư viện của Đại học Warszawa thì nhìn thấy trên một mặt tiền của thư viện một đoạn chương trình kèm dòng chữ “Liệu nó có dừng?”. Câu hỏi có vẻ thú vị, nên sau khi về nhà, Bajtazar đã thử giải đáp nó. Không may, khi chép lại đoạn mã, cậu đã ghi nhầm thành:

```pseudocode
while n > 1 do
    if n mod 2 = 0 then
        n := n / 2
    else
        n := 3 · n + 3
```

Bajtazar muốn xác định những giá trị ban đầu nào của biến $n$ làm chương trình mà cậu đã chép dừng lại. Ta giả sử biến $n$ có kích thước không giới hạn, nghĩa là nó có thể nhận các giá trị lớn tùy ý.

### Dữ liệu vào

Dòng đầu tiên và duy nhất chứa một số nguyên $n$ ($2 \le n \le 10^{14}$). Hãy kiểm tra chương trình đã cho có dừng với giá trị $n$ này hay không.

### Kết quả

Trên dòng đầu tiên và duy nhất, in một từ `TAK` (nghĩa là “có” trong tiếng Ba Lan) nếu chương trình dừng với giá trị $n$ đã cho; ngược lại, in `NIE` (nghĩa là “không”).

### Ví dụ

**Dữ liệu vào**

```text
4
```

**Kết quả**

```text
TAK
```

## Lời giải

Trong đề bài có một đoạn chương trình mà ta cần phân tích hành vi. Vì đã biết mã nguồn, ta có thể chép nguyên đoạn mã đó vào lời giải rồi chạy. Nếu với một giá trị $n$ cho trước mà chương trình dừng, ta lập tức biết câu trả lời. Trường hợp ngược lại khó hơn một chút: làm sao có thể chắc chắn rằng đoạn mã đang chạy sẽ không bao giờ dừng?

Ta có thể bắt đầu bằng một giả định rất táo bạo — và không hẳn có căn cứ: nếu đoạn mã chưa dừng sau, chẳng hạn, $100\,000$ vòng lặp thì ta coi như nó sẽ không bao giờ dừng.

Cách làm ấy rất dễ cài đặt, nhưng có hai nhược điểm. Thứ nhất, dựa vào đâu ta biết $100\,000$ vòng lặp là đủ? Thứ hai, nếu biểu diễn $n$ bằng số nguyên có dấu 64 bit (chẳng hạn kiểu `long long` trong C++), ta sẽ rơi vào một cái bẫy. Dù giá trị ban đầu của $n$ theo đề bài không vượt quá $10^{14}$, sau một số vòng lặp nó có thể trở nên lớn hơn rất nhiều. Ví dụ, với $n = 366\,713\,142\,269$, sau khoảng 160 vòng lặp, $n$ đạt

$$
10\,010\,331\,589\,553\,303\,736 > 10^{19},
$$

trong khi số nguyên có dấu 64 bit chỉ biểu diễn được các số không lớn hơn

$$
2^{63}-1 \approx 9{,}2234 \cdot 10^{18}.
$$

Hãy tiếp cận bài toán theo cách khác. Ta thử quan sát hành vi của đoạn mã với mọi $n$ từ 1 đến 20; máy tính có thể giúp làm việc này. Rất nhanh chóng, ta nhận thấy chương trình dừng với $n$ bằng $1, 2, 4, 8, 16$. Với những giá trị còn lại, nó lặp vô hạn vì kể từ một thời điểm nào đó, $n$ lần lượt nhận các giá trị

$$
3, 12, 6, 3, 12, 6, 3, 12, 6, \ldots
$$

Có vẻ như chương trình dừng đúng với các giá trị là lũy thừa của 2. Thật vậy, nếu $n$ là một lũy thừa của 2, đoạn mã sẽ liên tục chia $n$ cho 2 cho đến khi $n=1$. Do đó, trong trường hợp này chương trình chắc chắn dừng.

Ta có thể đoán rằng với mọi giá trị $n$ còn lại, chương trình sẽ chạy mãi mãi. Phỏng đoán này đúng, nhưng vì sao?

Nếu giá trị ban đầu của $n$ là số lẻ, phép gán

$$
n := 3n+3
$$

sẽ được thực hiện. Dễ thấy giá trị mới của $n$ chia hết cho 3. Hơn nữa, từ thời điểm đó trở đi, $n$ luôn chia hết cho 3. Quả vậy, nếu $n$ chia hết cho 3 thì bất kể ta thực hiện phép gán $n := n/2$ hay $n := 3n+3$, giá trị mới vẫn chia hết cho 3. Vì vậy, ta không bao giờ có thể đạt tới $n=1$.

Chỉ còn trường hợp $n$ chẵn nhưng không phải lũy thừa của 2. Khi đó, chương trình sẽ liên tục chia $n$ cho 2 cho đến khi nó trở thành số lẻ. Số lẻ này phải lớn hơn 1, bởi chỉ khi giá trị ban đầu là một lũy thừa của 2 thì quá trình chia liên tiếp mới kết thúc ở 1. Một khi $n$ đã trở thành số lẻ lớn hơn 1, theo phân tích ở trên, chương trình sẽ không dừng.

Vậy toàn bộ bài toán chỉ còn là kiểm tra $n$ có phải lũy thừa của 2 hay không. Có thể kiểm tra điều kiện này rất dễ dàng: chừng nào $n$ còn chia hết cho 2, ta tiếp tục chia nó cho 2. Nếu cuối cùng thu được $n=1$, giá trị ban đầu là một lũy thừa của 2; ngược lại thì không phải.

### Chứng minh tính đúng đắn

Ta chứng minh thuật toán in `TAK` khi và chỉ khi chương trình dừng.

- Nếu $n$ là lũy thừa của 2, viết $n=2^k$. Mỗi vòng lặp chia $n$ cho 2, nên sau đúng $k$ lần chia ta thu được $n=1$ và vòng lặp dừng. Thuật toán cũng chia hết các thừa số 2 và nhận được 1, do đó in `TAK`.
- Nếu $n$ không phải lũy thừa của 2, sau khi chia hết các thừa số 2, ta thu được một số lẻ lớn hơn 1. Ở vòng tiếp theo, giá trị mới là $3n+3$, nên chia hết cho 3. Từ đó về sau, cả hai phép biến đổi $n:=n/2$ (chỉ được thực hiện khi $n$ chẵn) và $n:=3n+3$ đều bảo toàn tính chia hết cho 3. Vì $1$ không chia hết cho 3, chương trình không thể đạt tới 1 và do đó không dừng. Thuật toán nhận được một số khác 1 nên in `NIE`.

Vậy thuật toán luôn cho câu trả lời đúng.

### Độ phức tạp

Thuật toán thực hiện nhiều nhất $\lfloor \log_2 n \rfloor$ phép chia, nên có độ phức tạp thời gian $O(\log n)$ và dùng $O(1)$ bộ nhớ.

### Một phép kiểm tra bằng toán tử bit

Ta còn có thể kiểm tra nhanh hơn bằng các toán tử trên bit. Toán tử AND theo bit (ký hiệu `&` trong C++) cho kết quả có bit 1 đúng tại những vị trí mà cả hai toán hạng đều có bit 1. Toán tử XOR theo bit (ký hiệu `^`) cho kết quả có bit 1 tại những vị trí mà hai toán hạng khác nhau.

Để kiểm tra $n$ có phải lũy thừa của 2 hay không, chỉ cần kiểm tra

$$
((n \mathbin{\mathrm{xor}} (n-1)) \mathbin{\mathrm{and}} n) = n.
$$

Một dạng tương đương và quen thuộc hơn, với $n>0$, là

$$
(n \mathbin{\mathrm{and}} (n-1)) = 0.
$$

### Bài toán Collatz

Trên mặt tiền thư viện của Đại học Warszawa thực sự có một đoạn mã gần giống đoạn mã trong đề. Tuy nhiên, đề bài nói rằng Bajtazar đã chép nhầm. Đoạn mã gốc trên tường thư viện là:

```pseudocode
while n > 1 do
    if n mod 2 = 0 then
        n := n / 2
    else
        n := 3 · n + 1
```

Ở dòng cuối là $n:=3n+1$ thay vì $n:=3n+3$. Dù hai đoạn mã chỉ khác nhau rất ít, khác biệt ấy lại có ý nghĩa lớn. Trong bài toán này, ta đã mô tả được tất cả các số làm chương trình dừng. Bài toán tương tự đối với đoạn mã trên tường thư viện khó hơn rất nhiều.

Năm 1937, nhà toán học người Đức Lothar Collatz đưa ra giả thuyết rằng đoạn mã trên dừng với mọi số nguyên dương $n$. Nhiều nhà toán học đã nghiên cứu giả thuyết này, nhưng tại thời điểm cuốn sách được biên soạn vẫn chưa ai chứng minh hoặc bác bỏ được nó. Bản tiếng Anh cho biết giả thuyết khi ấy đã được kiểm chứng bằng máy tính với mọi

$$
n < 20 \cdot 2^{58} \approx 5{,}7646 \cdot 10^{18},
$$

và thường được tin là đúng, nhưng chưa có một chứng minh hình thức. Vì vậy, nếu đề bài dùng đúng phép biến đổi của bài toán Collatz nguyên bản, câu hỏi “Liệu nó có dừng?” sẽ chưa thể được trả lời chắc chắn trong mọi trường hợp.
