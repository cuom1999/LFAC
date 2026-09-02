# Để mai làm ★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Jakub Radoszewski  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `jut`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2012/jut>


## Đề bài

> *Trì hoãn* (từ tiếng Latin *procrastinatio*, nghĩa là “để dành cho ngày mai”): thói quen liên tục dời những việc quan trọng sang một lúc muộn hơn.

Byteasar có thói quen để mọi việc đến phút chót. Có thể nói trì hoãn là tên đệm của anh. Tuy vậy, một khi đã hứa làm điều gì thì vẫn có thể tin cậy anh.

Sáng nay, Byteasar lập danh sách gồm \(n\) công việc phải hoàn thành trong thời gian tới. Công việc thứ \(i\) cần đúng \(d_i\) ngày **liên tiếp** để thực hiện và phải hoàn thành trong \(t_i\) ngày tới, tính từ hôm nay. Byteasar muốn biết mình có thể không làm gì trong bao lâu trước khi thật sự buộc phải bắt đầu. Hãy viết chương trình giúp anh tính điều đó; Byteasar có thể tự viết, nhưng như vậy trái với bản tính của anh.

### Dữ liệu vào

Dòng đầu chứa số nguyên \(n\) (\(1\le n\le 1\,000\,000\)), số công việc Byteasar phải làm.

\(n\) dòng sau mô tả các công việc. Dòng thứ \(i\) chứa hai số nguyên \(d_i,t_i\) (\(1\le d_i,t_i\le10^9\)). Bảo đảm rằng Byteasar có thể hoàn thành mọi công việc đúng hạn.

### Dữ liệu ra

In một số nguyên \(k\): số ngày lớn nhất Byteasar có thể tránh làm việc. Nói cách khác, chậm nhất vào ngày thứ \(k+1\), anh phải bắt đầu một công việc nào đó để vẫn có thể hoàn thành toàn bộ kế hoạch đúng hạn.

### Ví dụ

**Dữ liệu vào**

```text
3
2 8
1 13
3 10
```

**Dữ liệu ra**

```text
5
```

**Giải thích.** Byteasar nghỉ trong năm ngày đầu. Trong năm ngày tiếp theo, anh làm công việc thứ nhất rồi công việc thứ ba. Sau đó, anh dành một trong ba ngày kế tiếp để làm công việc thứ hai.

## Lời giải

Mỗi công việc \(i\) có thời lượng \(d_i\) và hạn hoàn thành \(t_i\). Ta biết chắc có một lịch khả thi; mục tiêu duy nhất là bắt đầu làm việc muộn nhất có thể.

Điều kiện “\(d_i\) ngày liên tiếp” thực ra không làm bài toán khó hơn. Nếu một lịch nào đó chia công việc \(i\) thành nhiều đoạn, ta có thể ghép các đoạn ấy thành một khối liên tục, rồi dời những công việc được thực hiện xen giữa lên sớm tương ứng. Các hạn hoàn thành không bị vi phạm. Vì thế chỉ cần xét các lịch trong đó mỗi công việc là một khối liên tục.

### Thứ tự công việc tối ưu

Các công việc nên được thực hiện theo thứ tự **không giảm của hạn hoàn thành**. Đây là quy tắc *earliest due date*.

Thật vậy, giả sử trong một lịch có hai công việc kề nhau \(A,B\), trong đó \(t_A>t_B\): công việc có hạn muộn hơn lại đứng ngay trước công việc có hạn sớm hơn. Hoán đổi hai khối công việc này:

- \(B\) hoàn thành sớm hơn trước, nên chắc chắn vẫn đúng hạn;
- \(A\) hoàn thành đúng thời điểm mà \(B\) từng hoàn thành; vì \(t_A>t_B\), \(A\) cũng vẫn đúng hạn.

Phép đổi chỗ không làm thời điểm bắt đầu của lịch sớm đi. Lặp lại cho đến khi hết nghịch thế, ta có một lịch tốt không kém, với các hạn đã sắp xếp. Do đó, sau khi sắp xếp, ta giả sử

\[
t_1\le t_2\le\cdots\le t_n.
\]

Dưới đây là hai cách nhìn dẫn đến thuật toán.

### Cách 1: quét từ đầu và theo dõi thời gian rỗi

Hãy lần lượt xét các công việc theo thứ tự trên và luôn bố trí chúng muộn nhất có thể. Sau khi xét \(i-1\) công việc đầu, toàn bộ chúng phải hoàn thành trong \(t_{i-1}\) đơn vị thời gian đầu tiên.

Ta chia các khoảng rỗi đang có thành hai phần:

- `initial_idle`: thời gian rỗi ngay từ đầu, trước khi Byteasar làm bất kỳ công việc nào. Đây là đáp án ta muốn cực đại hóa.
- `gap_idle`: tổng thời gian rỗi nằm giữa các công việc đã xếp.

Khởi đầu với công việc đầu tiên:

\[
\texttt{initial\_idle}=t_1-d_1,\qquad \texttt{gap\_idle}=0.
\]

Khi thêm công việc \(i\), cửa sổ thời gian được nới từ \(t_{i-1}\) đến \(t_i\), tức có thêm \(t_i-t_{i-1}\) ngày. Sau khi đặt công việc mới dài \(d_i\), cập nhật

\[
\texttt{gap\_idle}\mathrel{+}=t_i-t_{i-1}-d_i.
\]

Nếu `gap_idle` vẫn không âm, khoảng trống mới đủ để chứa công việc, nên chỉ có thêm thời gian rỗi ở giữa các công việc. Nếu nó âm, cần “mượn” thời gian từ phần lịch trước: đẩy các công việc trước đó sang trái, bắt đầu từ công việc gần nhất. Hình dung các công việc như những toa tàu: đẩy toa ngoài cùng bên phải sang trái sẽ kéo dồn những toa trước nó.

![Bước cuối khi xếp bốn công việc theo hạn hoàn thành; mỗi kiểu ô biểu diễn một công việc.](figures/2012-jut-fig-1.png)

Những khoảng trống xen kẽ bị dùng hết trước; chỉ khi cần mới ăn vào thời gian rỗi ban đầu. Vì vậy ta chỉ cần làm:

```pseudocode
sort jobs by nondecreasing t
initial_idle = t[1] - d[1]
gap_idle = 0

for i = 2..n:
    gap_idle += t[i] - t[i-1] - d[i]
    if gap_idle < 0:
        initial_idle += gap_idle
        gap_idle = 0

return initial_idle
```

Giá trị trả về chính là số ngày nghỉ lớn nhất ở đầu lịch.

### Rút gọn thành một công thức

Có thể loại bỏ cả hai biến thời gian rỗi. Xét một công việc \(j\) mà khi xử lý nó, ta phải giảm `initial_idle`. Khi đó, mọi khoảng trống ở giữa các công việc \(1,\ldots,j\) đã bị lấp kín; Byteasar làm liên tục từ sau thời gian nghỉ ban đầu đến thời điểm \(t_j\). Do đó lúc này

\[
\texttt{initial\_idle}=t_j-(d_1+d_2+\cdots+d_j).
\tag{1}
\]

Không biết trước \(j\) là công việc nào, nhưng đáp án không thể lớn hơn bất kỳ giá trị (1) nào: để hoàn thành \(j\) công việc đầu trước \(t_j\), cần tổng cộng \(d_1+\cdots+d_j\) ngày làm việc. Đồng thời, một trong các giá trị này chính là lần cuối `initial_idle` bị cập nhật. Vậy đáp án là

\[
\boxed{\min_{1\le i\le n}\left(t_i-\sum_{j=1}^{i}d_j\right)}.
\]

Đây là cách cài đặt ngắn gọn nhất: sau khi sắp xếp theo \(t_i\), cộng dồn các \(d_i\) vào `total_duration` và lấy giá trị nhỏ nhất của \(t_i-\texttt{total\_duration}\).

### Cách 2: đảo chiều thời gian

Cũng có thể lập lịch từ cuối về đầu. Đảo trục thời gian: mỗi hạn hoàn thành \(t_i\) biến thành thời điểm bắt đầu sớm nhất

\[
t'_i=-t_i.
\]

Ta nhận được bài toán tương đương: có các công việc thời lượng \(d_i\), mỗi việc không được bắt đầu trước \(t'_i\); hãy hoàn thành tất cả sớm nhất có thể. Vì \(t_1\le\cdots\le t_n\), sau khi đảo dấu ta duyệt các công việc theo thứ tự không giảm của \(t'_i\), tức theo hạn ban đầu từ lớn xuống nhỏ.

Gọi `finish_time` là thời điểm hoàn thành công việc cuối cùng đã xếp trong thời gian đảo. Công thức quy hoạch rất trực tiếp:

\[
\texttt{finish\_time}\leftarrow
\max(\texttt{finish\_time},t'_i)+d_i.
\]

Ban đầu đặt \(\texttt{finish\_time}=-\infty\). Sau khi xếp hết, đáp án của bài toán gốc là

\[
-\texttt{finish\_time}.
\]

Cách này tương đương với công thức ở phần trước, nhưng đôi khi dễ suy ra hơn khi quen với các bài lập lịch có *release time* (thời điểm sớm nhất được phép bắt đầu).

### Độ đúng đắn

Ta chứng minh công thức đã rút gọn trả về đáp án.

Gọi

\[
S_i=\sum_{j=1}^{i}d_j
\]

là tổng thời lượng \(i\) công việc có hạn sớm nhất.

**Bổ đề 1.** Mọi lịch khả thi có số ngày nghỉ ban đầu \(k\) đều thỏa

\[
k\le t_i-S_i
\]

với mọi \(i\).

**Chứng minh.** Nhờ lập luận đổi chỗ ở trên, xét lịch theo thứ tự hạn không giảm. \(i\) công việc đầu cần đúng \(S_i\) ngày làm việc và tất cả phải xong không muộn hơn ngày \(t_i\). Nếu đã nghỉ \(k\) ngày đầu, chỉ còn \(t_i-k\) ngày trước hạn đó, nên \(S_i\le t_i-k\). Chuyển vế thu được bất đẳng thức cần chứng minh. \(\square\)

**Bổ đề 2.** Đặt

\[
k^*=\min_i(t_i-S_i).
\]

Nếu Byteasar nghỉ \(k^*\) ngày đầu rồi làm các công việc theo thứ tự hạn không giảm, không chèn thêm khoảng nghỉ, thì lịch hợp lệ.

**Chứng minh.** Công việc \(i\) hoàn thành ở thời điểm \(k^*+S_i\). Theo định nghĩa của giá trị nhỏ nhất, \(k^*\le t_i-S_i\); do đó \(k^*+S_i\le t_i\). Điều này đúng với mọi \(i\), nên mọi hạn đều được thỏa. \(\square\)

**Định lý.** \(k^*\) là số ngày nghỉ ban đầu lớn nhất có thể.

**Chứng minh.** Bổ đề 1 cho biết không lịch nào nghỉ quá \(k^*\) ngày. Bổ đề 2 xây dựng một lịch nghỉ đúng \(k^*\) ngày. Vậy \(k^*\) là tối ưu. \(\square\)

### Độ phức tạp

Sắp xếp \(n\) công việc theo hạn mất \(O(n\log n)\). Lần quét cộng dồn sau đó mất \(O(n)\). Tổng thời gian là

\[
O(n\log n),
\]

và bộ nhớ phụ là \(O(n)\) để lưu các công việc. Cần dùng số nguyên 64 bit: tổng thời lượng có thể đạt \(10^{15}\).
