# Hang động ★★★

**Tác giả đề:** Jakub Łącki  
**Tác giả lời giải:** Jakub Łącki  
**Bộ nhớ:** 256 MB  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2011/jas>


## Đề bài

Byteasar vừa khám phá một hang động gồm $n$ phòng, được nối với nhau bằng các hành lang sao cho giữa hai phòng bất kỳ luôn có đúng một đường đi. Nói cách khác, các phòng và hành lang tạo thành một cây.

Hang động cần được khảo sát kỹ hơn, nên Byteasar nhờ các bạn giúp đỡ. Mọi người muốn chia thành các nhóm. Mỗi nhóm phải khảo sát cùng số lượng phòng; mỗi phòng phải được khảo sát bởi đúng một nhóm. Ngoài ra, để các nhóm không cản trở công việc của nhau, các thành viên của một nhóm phải có thể đi giữa mọi cặp phòng được giao cho nhóm đó mà không cần đi qua phòng của nhóm khác.

Có bao nhiêu số nhóm khác nhau mà các nhà thám hiểm có thể chia thành?

### Dữ liệu vào

Dòng đầu chứa một số nguyên $n$ ($2\le n\le3\,000\,000$), là số phòng trong hang. Các phòng được đánh số từ $1$ đến $n$.

$n-1$ dòng tiếp theo mô tả các hành lang. Dòng thứ $i$ trong số đó chứa một số nguyên $a_i$ $1\le a_i\le i$, biểu thị một hành lang nối phòng $i+1$ với phòng $a_i$.

### Dữ liệu ra

In trên một dòng tất cả các số nguyên $k$ sao cho có thể chia các phòng thành $k$ tập rời nhau, có cùng kích thước, và có thể đi giữa mọi cặp phòng thuộc cùng một tập chỉ qua các phòng của tập đó. Các số phải được in theo thứ tự tăng dần, cách nhau đúng một dấu cách.

### Ví dụ

**Dữ liệu vào**

```text
6
1
2
3
3
5
```

**Kết quả**

```text
1 3 6
```

## Lời giải

Ta dùng ngôn ngữ lý thuyết đồ thị. Hang động là một cây liên thông không có chu trình. Điều kiện “đi giữa mọi cặp phòng của cùng một nhóm mà không rời nhóm” nói đúng rằng mỗi nhóm phải cảm sinh một cây liên thông.

Để tránh nhầm lẫn với $k$ là **số nhóm** trong dữ liệu ra, trong lời giải này gọi $s$ là số đỉnh của mỗi mảnh. Nếu có $k$ nhóm thì

\[
s=\frac nk,\qquad k=\frac ns.
\]

Vì vậy $s$ bắt buộc là một ước của $n$. Một cách chia thành các mảnh có $s$ đỉnh sẽ có đúng $n/s$ mảnh. Muốn tách một cây thành $n/s$ cây con, ta phải xóa đúng

\[
\frac ns-1
\]

cạnh.

### Cách làm trực tiếp

Trước hết, cố định một ước $s$ của $n$ và kiểm tra liệu có thể chia cây thành các mảnh liên thông, mỗi mảnh có $s$ đỉnh hay không.

Thoạt nhìn, cách chia có thể tưởng như có nhiều lựa chọn; thực ra, nếu nó tồn tại thì được xác định duy nhất. Phác thảo chứng minh như sau. Xét một cách chia với $s<n$. Trong cây các mảnh, luôn có một mảnh lá $P$, tức nó chỉ nối với phần còn lại bằng đúng một cạnh $e$. Trong mọi cách chia hợp lệ với cùng $s$, cạnh $e$ buộc phải nằm giữa hai mảnh: nếu không, phía chứa $P$ sẽ có số đỉnh nhỏ hơn hoặc lớn hơn $s$. Xóa $P$ và lặp lại lập luận với phần cây còn lại. Do đó từng cạnh cần cắt được quyết định lần lượt, nên cách chia là duy nhất.

Ta có thể kiểm tra bằng DFS hậu tự. Khi trở về từ các lời gọi đệ quy, tính kích thước các cây con. Nếu tại một đỉnh có cây con hiện thời đúng $s$ đỉnh, cắt cạnh nối cây con ấy với phần còn lại; các đỉnh của nó sẽ không còn được tính trong những kích thước phía trên. Nếu cây thật sự chia được, ta sẽ cắt đúng $n/s-1$ cạnh và phần còn lại ở gốc có đúng $s$ đỉnh.

Chiều ngược lại cũng đúng: nếu đã cắt $n/s-1$ lần, mỗi lần tách ra một cây có $s$ đỉnh, phần còn lại cũng có $s$ đỉnh vì toàn bộ cây có $n$ đỉnh. Vậy ta đã thu được $n/s$ mảnh hợp lệ.

Với một $s$ cố định, DFS mất $O(n)$ thời gian. Nếu thử mọi ước của $n$, thời gian là

\[
O\bigl(n\,d(n)\bigr),
\]

trong đó $d(n)$ là số ước dương của $n$. Ta có thể duyệt $1,2,\ldots,n$ để nhận biết các ước trong $O(n)$ thời gian, nhưng điều đó vẫn chưa đủ nhanh: trong đoạn đến $3\cdot10^6$, số $2\,882\,880$ có tới $336$ ước. Trường hợp xấu này có trong bộ kiểm thử.

### Đếm đồng thời cho mọi kích thước

Ta xét tất cả các $s$ trong một lượt DFS. Cố định một cạnh $e$. Nếu xóa $e$, cây được tách thành hai phần có kích thước $a$ và $n-a$. Khi nào cạnh này phải bị cắt để chia thành các mảnh kích thước $s$?

Ta sẽ dùng nhận xét sau.

**Mệnh đề 1.** Cây chia được thành các mảnh có $s$ đỉnh khi và chỉ khi có đúng $n/s-1$ cạnh mà hai phía của cạnh đều có số đỉnh là bội của $s$.

**Chứng minh.** Nếu tồn tại cách chia, ta cắt đúng $n/s-1$ cạnh. Mỗi phía của một cạnh bị cắt là hợp của một số nguyên các mảnh kích thước $s$, nên số đỉnh ở cả hai phía chia hết cho $s$.

Ngược lại, giả sử có đúng $n/s-1$ cạnh thỏa điều kiện. Xóa toàn bộ các cạnh đó. Mỗi thành phần liên thông nhận được có số đỉnh chia hết cho $s$: có thể thấy điều này bằng cách xét tổng số đỉnh ở mỗi phía của các cạnh bị xóa. Ta thu được $n/s$ thành phần không rỗng, tổng cộng $n$ đỉnh, và mỗi thành phần có kích thước là một bội dương của $s$. Vì tổng kích thước là $(n/s)s$, mỗi thành phần bắt buộc có chính xác $s$ đỉnh. \(\square\)

Như vậy, chỉ cần đếm số cạnh thỏa điều kiện với từng $s$. Gọi `edg[s]` là số cạnh mà hai phía đều có kích thước là bội của $s$.

Với cạnh chia cây thành $a$ và $n-a$ đỉnh, ta tăng `edg[s]` với mọi $s$ chia hết cả $a$ lẫn $n-a$. Nói cách khác, $s$ là một ước của

\[
\gcd(a,n-a).
\]

Không nên duyệt ngay các ước ấy cho từng cạnh. Thay vào đó, dùng mảng phụ `t`. Khi cần tăng `edg[s]` thêm $1$ với mọi ước $s$ của một số $x$, chỉ cần tăng `t[x]` thêm $1$. Vì vậy, khi DFS tính được kích thước $a$ của một phía của mỗi cạnh, ta thực hiện

\[
\texttt{t}[\gcd(a,n-a)]\mathrel{+}=1.
\]

Sau khi xử lý tất cả cạnh, khôi phục các giá trị cần đếm bằng

\[
\texttt{edg}[s]=\sum_{j:\\,s\mid j}\texttt{t}[j].
\]

Thật vậy, `t[j]` đóng góp cho đúng mọi ước của $j$.

Cuối cùng, với mỗi ước $s$ của $n$, nếu

\[
\texttt{edg}[s]=\frac ns-1,
\]

thì kích thước mảnh $s$ là khả thi theo Mệnh đề 1. Khi đó in số nhóm $n/s$. Sắp xếp các số được in theo thứ tự tăng dần (hoặc duyệt các ước $s$ theo thứ tự giảm dần).

### Phân tích độ phức tạp

Tính các kích thước cây con và điền `t` cần một DFS, ngoài các phép GCD. Tính `edg[s]` bằng công thức trên duyệt các bội của $s$. Chỉ cần xét $s\mid n$, nên tổng số bước là

\[
\sum_{s\mid n}\frac ns.
\]

Khi $s$ chạy qua các ước của $n$ thì $n/s$ cũng chạy qua đúng các ước ấy theo thứ tự ngược lại. Tổng trên bằng $D(n)$, tổng các ước của $n$. Ta có $D(n)=O(n\log\log n)$, nên phần này không chi phối thời gian chạy.

Phép toán đắt nhất là tính $\gcd(a,n-a)$ cho $O(n)$ cạnh. Thuật toán Euclid cần $O(\log n)$ thời gian cho một GCD, vì thế tổng thời gian là

\[
O(n\log n),
\]

và bộ nhớ là $O(n)$.

### Cải tiến thêm

Ta còn có thể tiền xử lý mọi giá trị

\[
\gcd(i,n-i),\qquad i=1,\ldots,n,
\]

trong $O(n\log\log n)$ thời gian. Nếu $d$ chia cả $i$ lẫn $n-i$, thì $d$ cũng chia $n$. Do đó GCD nói trên chính là ước lớn nhất của $n$ chia $i$.

Khởi tạo mảng `gcd` rỗng. Duyệt các ước $d$ của $n$ theo thứ tự tăng dần; với mỗi $d$, duyệt các bội $j d$ và gán

\[
\texttt{gcd}[j d]=d.
\]

Do $d$ được duyệt tăng dần, lần gán cuối cùng cho mỗi vị trí là ước lớn nhất của $n$ chia vị trí đó, tức đúng bằng $\gcd(jd,n-jd)$. Tổng số lần cập nhật giống phần tính `edg`, do đó là $O(n\log\log n)$. Thay các phép Euclid bằng mảng này, toàn bộ thuật toán có thời gian $O(n\log\log n)$. Trong thực tế, mức cải thiện thường không đáng kể.

### Một ghi chú về số lượng ước

Ta đã dùng hàm $d(n)$ đếm số ước. Có một cận đơn giản:

\[
d(n)<2\sqrt n.
\]

Thật vậy, có nhiều nhất $\sqrt n$ ước không vượt quá $\sqrt n$, và mỗi ước lớn hơn $\sqrt n$ ghép cặp với một ước nhỏ hơn $\sqrt n$. Một cận tiệm cận mạnh hơn là

\[
d(n)=n^{O(1/\log\log n)}.
\]

Hàm $\log\log n$ tăng rất chậm: nếu logarit lấy cơ số $2$ thì $\log\log(2^{32})=5$ và $\log\log(2^{64})=6$. Khi ước lượng thời gian trong thực hành với các số không quá $2^{64}$, có thể coi xấp xỉ trường hợp xấu của $d(n)$ là khoảng $3\sqrt n$. Xấp xỉ này không chặt chẽ theo nghĩa toán học, nhưng khá hữu ích trong thực tế.
