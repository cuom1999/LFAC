# Bytehattan ★★★

**Tác giả đề:** Jakub Łącki  
**Tác giả lời giải:** Jakub Łącki  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `baj`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2013/baj>


## Đề bài

Bytehattan là một hòn đảo thuộc thủ đô của Byteania. Trên đảo thường xuyên diễn ra diễu hành, lễ hội và nhiều sự kiện khác. Chúng nhiều đến mức thường gây đóng đường và ùn tắc giao thông nghiêm trọng. Byteasar làm việc tại tòa thị chính và được giao nhiệm vụ theo dõi giao thông trong thành phố.

Các con phố ở Bytehattan tạo thành một lưới đều kích thước \(n\times n\). Hãy xem bản đồ Bytehattan như một hệ tọa độ: với mỗi cặp số nguyên \(x,y\) thỏa \(1\le x,y\le n\), tại điểm \((x,y)\) có một giao lộ. Mọi hai giao lộ cách nhau đúng \(1\) đơn vị đều được nối bằng một con phố dài \(1\).

Byteasar nhận được các thông báo đóng đường. Mỗi thông báo nói rằng từ thời điểm đó một con phố sẽ không thể đi qua. Sau khi nhận thông báo về việc đóng một con phố, Byteasar phải xác định liệu vẫn có thể đi lại giữa hai giao lộ ở hai đầu phố đó chỉ bằng những con phố chưa bị đóng hay không. Hãy giúp anh ấy viết chương trình hỗ trợ công việc này.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n,k\) \((2\le n\le1500,\ 1\le k\le2n(n-1))\), lần lượt là kích thước lưới phố của Bytehattan và số thông báo đóng phố.

Mỗi trong \(k\) dòng tiếp theo mô tả một lần đóng phố; các thông báo được cho theo thứ tự thời gian. Mỗi dòng gồm hai mô tả phố liên tiếp nhau. Trên thực tế, **chính xác một** trong hai phố ấy sẽ bị đóng. Nếu sau khi đóng con phố được mô tả ở dòng trước đó vẫn có thể đi lại giữa hai giao lộ ở hai đầu của nó, thì phố thứ nhất trong cặp hiện tại bị đóng. Ngược lại, phố thứ hai bị đóng. Lần đóng đầu tiên trong \(k\) lần đóng được mô tả luôn áp dụng cho phố thứ nhất của cặp đầu tiên. Mỗi con phố chỉ bị đóng nhiều nhất một lần.

Một mô tả phố gồm hai số nguyên \(a_i,b_i\) \(1\le a_i,b_i\le n\), sau đó là một chữ cái \(c_i\) với \(c_i\in\{\texttt{N},\texttt{E}\}\). Bộ ba này xác định một con phố có một đầu tại giao lộ \(a_i,b_i\). Nếu \(c_i=\texttt{N}\), đầu kia là \(a_i,b_i+1\); nếu \(c_i=\texttt{E}\), đầu kia là \(a_i+1,b_i\). Khi \(c_i=\texttt{N}\), ta luôn có \(b_i<n\); tương tự, khi \(c_i=\texttt{E}\), ta luôn có \(a_i<n\).

> Định dạng dữ liệu vào khác thường này cố ý buộc chương trình phải xử lý một lần đóng phố trước khi có thể xử lý lần đóng tiếp theo.

### Dữ liệu ra

In đúng \(k\) dòng. Nếu sau lần đóng phố thứ \(i\), vẫn có thể đi lại giữa hai giao lộ ở hai đầu của phố vừa đóng, dòng thứ \(i\) in `TAK` ("có" trong tiếng Ba Lan). Ngược lại, in `NIE` ("không").

### Ví dụ

**Dữ liệu vào**

```text
3 4
2 1 E 1 2 N
2 1 N 1 1 N
3 1 N 2 1 N
2 2 N 1 1 N
```

**Dữ liệu ra**

```text
TAK
TAK
NIE
NIE
```

## Lời giải

Trong bài Bytehattan, ta có một đồ thị vô hướng mà các cạnh lần lượt bị xóa. Sau mỗi lần xóa, cần biết hai đỉnh ở hai đầu cạnh vừa xóa có còn nằm trong cùng một thành phần liên thông hay không. Tương đương, ta cần kiểm tra xem việc xóa cạnh có làm tăng số thành phần liên thông hay không.

Bài toán duy trì số thành phần liên thông khá dễ khi **thêm** cạnh: chỉ cần dùng cấu trúc dữ liệu các tập rời nhau, còn gọi là **find-union** hay DSU. Tuy vấn đề của ta có vẻ ngược lại, DSU vẫn là công cụ cần thiết.

Trước hết, tại sao dữ liệu vào lại có định dạng khác thường này? Nếu chỉ cho danh sách các cạnh bị xóa, không những dữ liệu vào mà cả bài toán cũng đơn giản hơn: ta có thể đọc toàn bộ các lần xóa rồi mô phỏng quá trình theo thứ tự ngược. Khi đó các cạnh được **thêm** vào đồ thị; với mỗi cạnh thêm vào, chỉ cần kiểm tra nó có nối hai thành phần khác nhau hay không. DSU sẽ cho thuật toán thời gian tổng

\[
O\bigl(n^2+k\alpha(n)\bigr),
\]

trong đó \(\alpha\) là hàm Ackermann ngược. Định dạng ở đây không cho phép mẹo đó, nhưng đây là một kỹ thuật rất hữu ích cần ghi nhớ.

### Các mặt của đồ thị phẳng

Chìa khóa là dạng đặc biệt của đồ thị: nó là một **đồ thị phẳng**. Nghĩa là có thể vẽ đồ thị trên mặt phẳng sao cho không có hai cạnh nào cắt nhau. Hãy xét cách vẽ tự nhiên theo lưới của đề bài. Ban đầu, hình vẽ có \((n-1)\times(n-1)\) miền hữu hạn kích thước \(1\times1\), cùng một miền vô hạn ở bên ngoài. Những miền ấy được gọi là các **mặt**.

Ta dùng một sự kiện rất quan trọng về đồ thị phẳng. Với một cách vẽ bất kỳ của đồ thị phẳng, ký hiệu \(v\) là số đỉnh, \(e\) là số cạnh, \(f\) là số mặt và \(c\) là số thành phần liên thông. Khi đó công thức Euler cho

\[
v-e+f=c+1.
\]

Công thức này là nền tảng của lời giải. Nó cho thấy để xác định số thành phần liên thông của một đồ thị phẳng, chỉ cần biết số đỉnh, số cạnh và số mặt. Trong bài này số đỉnh không thay đổi, luôn bằng \(n^2\). Số cạnh ban đầu là \(2n(n-1)\) và giảm \(1\) sau mỗi lần xóa. Phần khó hơn là duy trì số mặt.

Ban đầu có \((n-1)^2+1\) mặt. Khi xóa một cạnh, hãy xét hai phía của cạnh đó thuộc về những mặt nào. Nếu chúng là hai mặt khác nhau thì sau khi xóa cạnh, hai mặt nhập lại thành một mặt.

Mỗi mặt của đồ thị sau một số lần xóa chỉ là hợp của một số mặt của đồ thị ban đầu. Hơn nữa, khi xóa thêm cạnh, các mặt chỉ có thể nhập lại với nhau, không bao giờ tách ra. Vì vậy ta có thể biểu diễn các mặt bằng DSU: mỗi tập DSU là một tập các mặt ban đầu. DSU cho phép kiểm tra hai phía của một cạnh đã thuộc cùng một mặt hay chưa, và nhập hai mặt khác nhau. Mỗi lần xóa cần nhiều nhất hai thao tác DSU, nên thời gian là

\[
O\bigl(n^2+k\alpha(n)\bigr).
\]

Như vậy ta duy trì được số đỉnh, cạnh và mặt. Từ công thức Euler suy ra: nếu việc xóa cạnh **không làm giảm số mặt**, thì số thành phần liên thông tăng lên. Ngược lại, nếu hai mặt khác nhau nhập thành một, thì số thành phần liên thông không đổi. Do đó, sau khi xem hai phía của cạnh bằng DSU, ta lập tức in được đáp án.

Ví dụ, nếu cả hai phía của một cạnh \(uv\) là cùng một mặt, xóa \(uv\) sẽ làm tăng số thành phần liên thông. Còn nếu cạnh \(vw\) ngăn cách hai mặt khác nhau, xóa nó sẽ hợp nhất hai mặt đó và không làm tăng số thành phần liên thông.

![Hình 1. Hai phía của cạnh \(uv\) thuộc cùng một mặt nên xóa nó làm tăng số thành phần liên thông; hai phía của \(vw\) thuộc hai mặt khác nhau nên xóa nó chỉ hợp nhất hai mặt.](figures/2013-baj-fig-1.png)

### Có thể làm gì thêm?

Bài toán chỉ hỏi về hai đầu của cạnh vừa xóa. Liệu có thể trả lời câu hỏi tổng quát hơn: sau các lần xóa, có tồn tại đường đi giữa hai đỉnh bất kỳ được chỉ định hay không? Hóa ra một thuật toán rất giống có thể làm được điều đó.

Duy trì mảng `component_id`, trong đó `component_id[v]` là mã của thành phần liên thông chứa đỉnh \(v\). Các mã cụ thể có thể tùy ý, miễn là các đỉnh trong cùng một thành phần có cùng mã, còn các đỉnh ở hai thành phần khác nhau có mã khác nhau.

Sau khi xóa cạnh \(uw\), nếu số thành phần liên thông không tăng thì không cần làm gì. Nếu có tăng, đồ thị tách thành hai thành phần \(C_u\) và \(C_w\), lần lượt chứa \(u\) và \(w\). Khi ấy, chạy đồng thời hai phép duyệt theo chiều sâu (DFS) bắt đầu tại \(u\) và \(w\); ngay khi một phép duyệt kết thúc, dừng phép còn lại. Bằng cách này ta tìm được thành phần nhỏ hơn trong hai thành phần mới. Không mất tính tổng quát, giả sử

\[
|C_u|\le |C_w|.
\]

Khi đó \(C_u\) có kích thước không quá một nửa thành phần \(C_u\cup C_w\) đã bị tách bởi việc xóa cạnh \(uw\). Để cập nhật `component_id`, chỉ cần gán một mã mới, duy nhất cho mọi \(x\in C_u\).

Lần cập nhật này tốn \(O(|C_u|\). Hai DFS chạy song song cũng tốn \(O(|C_u|\), vì chúng kết thúc cùng lúc. Ta dùng sự kiện rằng một thành phần liên thông phẳng có \(v\) đỉnh và \(e\) cạnh thì

\[
e\le3v-6.
\]

Vì vậy thời gian của toàn bộ thuật toán tỉ lệ với tổng số lần thay đổi trong mảng `component_id`. Mỗi lần thay đổi `component_id[x]`, kích thước thành phần chứa \(x\) giảm ít nhất hai lần. Do đó mã của mỗi đỉnh thay đổi nhiều nhất \(O(\log n)\) lần. Lưới có \(n^2\) đỉnh, nên tổng số thay đổi là \(O(n^2\log n)\), và việc duy trì mảng `component_id` cũng chạy trong

\[
O(n^2\log n).
\]

Khi đã biết mảng `component_id`, mỗi truy vấn về việc hai đỉnh có liên thông hay không được trả lời trong thời gian hằng số: chỉ cần so sánh hai mã. Nhờ vậy, với chi phí chỉ tăng không nhiều, ta giải được bài toán tổng quát hơn đáng kể so với bài gốc.
