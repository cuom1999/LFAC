# Người hùng ★★★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Jakub Łącki  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `her`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2013/her>


## Đề bài

Byteotheus, người hùng Byteania nổi tiếng nhất, lại một lần nữa chiến thắng trở về sau trận chiến. Trong khi thủy thủ đoàn đang chất những chiến lợi phẩm lên tàu, Byteotheus ngồi trong khoang để lên đường về hòn đảo quê hương Bitaca. Đây không phải việc dễ dàng: nhiều vị thần ghen tị với sự mến mộ mà dân chúng dành cho anh và rất muốn làm anh mất mặt. May mắn thay, một số vị thần lại có thiện cảm với anh, đặc biệt là nữ thần Bythena. Chính nàng đã gửi cho Byteotheus một giấc mơ vào đêm qua, cảnh báo anh về những hiểm nguy có thể gặp trên đường.

Trên Biển Byteania có \(n\) hòn đảo, được đánh số từ \(1\) đến \(n\). Hiện tàu của Byteotheus ở đảo \(1\), còn đích đến Bitaca là đảo \(n\). Một số cặp đảo được nối bởi các hải trình một chiều. Mỗi đảo là điểm xuất phát của nhiều nhất \(10\) hải trình. Đánh số các hải trình từ \(1\) đến \(m\); hải trình thứ \(i\) đi từ đảo \(a_i\) đến đảo \(b_i\), và mất đúng \(d_i\) ngày. Nếu tàu khởi hành theo hải trình thứ \(i\) từ đảo \(a_i\) vào lúc bình minh của ngày \(j\), nó đến đảo \(b_i\) vào lúc bình minh của ngày \(j+d_i\).

Tàu được phép chờ tại bất kỳ đảo nào lâu tùy ý trước khi lên đường tiếp. Tuy nhiên, sau khi đã rời một đảo theo một hải trình, tàu không thể đổi hướng hay đi lâu hơn thời gian của hải trình đó. Byteotheus có thể bắt đầu chuyến đi từ đảo \(1\) sớm nhất vào lúc bình minh của ngày thứ nhất.

Cảnh báo của Bythena rất cụ thể. Nàng cho Byteotheus một danh sách chính xác gồm \(p\) cạm bẫy do các vị thần dựng lên. Mỗi cạm bẫy nằm trên một đảo và hoạt động trong một khoảng thời gian. Chính xác hơn, cạm bẫy thứ \(i\) ở đảo \(w_i\), hoạt động từ ngày \(s_i\) đến hết ngày \(k_i\). Chúng cực kỳ nguy hiểm: nếu tàu của Byteotheus có mặt ở một đảo đang có cạm bẫy hoạt động, không ai sống sót. May thay, Bitaca không có cạm bẫy; đồng thời trên đảo \(1\), không có cạm bẫy nào hoạt động trong ngày đầu tiên.

Byteotheus muốn chọn đường về nhà sao cho tránh được mọi cạm bẫy. Hãy xác định số ngày ít nhất cần thiết để về Bitaca an toàn.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n,m\)

\[
2\le n\le100\,000,\qquad 1\le m\le1\,000\,000,
\]

lần lượt là số đảo và số hải trình.

\(m\) dòng tiếp theo mô tả các hải trình. Dòng thứ \(i\) chứa ba số nguyên \(a_i,b_i,d_i\)

\[
1\le a_i,b_i\le n,\qquad a_i\ne b_i,\qquad 1\le d_i\le10^9,
\]

nghĩa là hải trình thứ \(i\) đi từ \(a_i\) đến \(b_i\), mất \(d_i\) ngày. Mọi hải trình đều là một chiều; từ mỗi đảo có nhiều nhất \(10\) hải trình xuất phát.

Dòng kế tiếp chứa số nguyên \(p\) 

\[
0\le p\le100\,000,
\]

là số cạm bẫy. \(p\) dòng sau mô tả các cạm bẫy. Dòng thứ \(i\) chứa ba số nguyên \(w_i,s_i,k_i\)

\[
1\le w_i<n,\qquad 1\le s_i\le k_i\le10^9,
\]

nghĩa là cạm bẫy thứ \(i\) nằm ở đảo \(w_i\), hoạt động từ ngày \(s_i\) đến hết ngày \(k_i\). Nếu \(w_i=1\) thì luôn có \(s_i>1\).

### Dữ liệu ra

Nếu không thể lập một hành trình tránh mọi cạm bẫy, in `NIE` (nghĩa là “không” trong tiếng Ba Lan).

Ngược lại, in một số nguyên \(d\): số ngày nhỏ nhất để hoàn thành chuyến đi. Nói cách khác, tàu đến Bitaca vào lúc bình minh của ngày \(d+1\).

### Ví dụ

**Dữ liệu vào**

```text
5 6
1 2 3
1 4 13
2 3 1
2 4 2
3 2 2
4 5 1
5
1 2 4
1 8 8
2 6 7
2 10 11
4 6 7
```

**Dữ liệu ra**

```text
10
```

Byteotheus khởi hành từ đảo \(1\) lúc bình minh ngày thứ nhất và đến đảo \(2\) vào ngày thứ tư. Anh chờ tại đó một ngày rồi đi đến đảo \(3\). Đến đảo \(3\) vào ngày thứ sáu, anh lập tức quay về đảo \(2\); từ đây, vào ngày thứ tám, anh đi tới đảo \(4\). Anh đến đảo \(4\) vào ngày thứ mười và cuối cùng đến Bitaca vào ngày thứ mười một.

## Lời giải

Đây là một biến thể khác của bài toán đường đi ngắn nhất trong đồ thị. Lời giải dựa trên thuật toán Dijkstra, vốn tìm khoảng cách ngắn nhất từ một đỉnh xuất phát trong đồ thị có hướng với trọng số không âm.

### Vì sao không thể dùng Dijkstra trực tiếp?

Trong Dijkstra thông thường, với mỗi đỉnh \(v\) ta duy trì \(d[v]\): độ dài ngắn nhất của một đường đi từ đỉnh xuất phát đến \(v\) đã được xây dựng. Ban đầu, \(d[\text{start}]=0\), các giá trị khác là \(\infty\). Ta chia các đỉnh thành đã xử lý và chưa xử lý. Ở mỗi bước, chọn đỉnh chưa xử lý \(u\) có \(d[u]\) nhỏ nhất, *relax* mọi cạnh đi ra từ \(u\), rồi đánh dấu \(u\) đã xử lý. Relax cạnh có hướng \(uw\) nghĩa là thử cải thiện \(d[w]\) bằng \(d[u]\) cộng trọng số cạnh \(uw\).

Nếu chỉ tạo một đỉnh cho mỗi đảo và một cạnh cho mỗi hải trình, ta có \(n\) đỉnh, \(m\) cạnh. Nhưng cạm bẫy khiến không phải lúc nào cũng được phép ở một đảo, nên không thể áp dụng nguyên vẹn Dijkstra trên đồ thị này.

Với mỗi đảo, các khoảng thời gian cạm bẫy hoạt động chia thời gian thành những **khoảng được phép**: các khoảng cực đại mà ta được phép hiện diện trên đảo. Sau khi gộp các khoảng cạm bẫy chồng lấn trên từng đảo, số khoảng được phép trên tất cả các đảo là

\[
O(n+p).
\]

Đây sẽ là các đỉnh của đồ thị mới.

### Đỉnh là một khoảng thời gian được phép

Xét một khoảng được phép \(v=[a,b]\) tại đảo \(s\). Ta gán cho nó giá trị \(d[v]\): thời điểm sớm nhất \(t\in[a,b]\) mà ta có thể đến đảo \(s\) trong khoảng này. Nếu không thể đến, đặt \(d[v]=\infty\).

Điểm quan trọng là: nếu đến được đảo \(s\) lúc \(t\in[a,b]\), ta cũng có thể ở đó tại mọi thời điểm

\[
t'\in[t,b],
\]

vì ta chỉ cần chờ trên đảo. Ban đầu, mọi giá trị là \(\infty\), trừ khoảng được phép ở đảo \(1\) chứa thời điểm bắt đầu chuyến đi; giá trị của khoảng đó là \(0\). Mọi khoảng đều bắt đầu ở trạng thái chưa xử lý.

Ta vẫn chạy Dijkstra: ở mỗi bước, chọn khoảng chưa xử lý \(v=[a,b]\) có \(d[v]\) nhỏ nhất. Giả sử \(v\) thuộc đảo \(s\), và

\[
t=d[v].
\]

Xét một hải trình đi từ \(s\) đến đảo \(r\), có độ dài \(\ell\). Ta có thể khởi hành ở bất cứ thời điểm nào từ \(t\) đến \(b\), nên có thể đến đảo \(r\) ở bất cứ thời điểm nào trong đoạn

\[
[t+\ell,\ b+\ell]. \tag{1}
\]

Vì vậy, cần relax tất cả các khoảng được phép của đảo \(r\) có giao khác rỗng với đoạn (1). Nếu các khoảng của mỗi đảo được sắp theo đầu trái (hoặc đầu phải; vì chúng rời nhau nên hai cách là tương đương), ta có thể duyệt chính xác các khoảng liên quan.

Với khoảng giao đầu tiên \([a_1,b_1]\), thời điểm đến sớm nhất là

\[
\max(a_1,t+\ell).
\]

Các khoảng giao tiếp theo sẽ được xử lý bằng một quan sát mạnh hơn.

### Quan sát giúp thuật toán đủ nhanh

Ngây thơ mà nói, trên một đảo có thể có \(p\) khoảng được phép, và có thể có rất nhiều lần relax hải trình đi vào đảo ấy. Nếu mỗi lần đều duyệt lại tất cả \(p\) khoảng, tổng công việc có thể lên đến bậc \(np\), quá lớn.

Quay lại đoạn đến được \([t+\ell,b+\ell]\). Giả sử nó giao với các khoảng được phép của đảo đích

\[
[a_1,b_1], [a_2,b_2],\ldots,[a_k,b_k],
\]

trong đó

\[
a_1\le b_1<a_2\le b_2<\cdots<a_k\le b_k.
\]

Với mọi khoảng từ khoảng thứ hai trở đi, ta đến được ngay lúc nó bắt đầu: 

\[
d[a_i,b_i]\le a_i\qquad (i=2,\ldots,k).
\]

Nhưng không thể đến một khoảng thời gian được phép sớm hơn đầu trái của chính nó. Do đó, sau khi gán giá trị \(a_i\), khoảng này đã nhận khoảng cách tối ưu vĩnh viễn và **không bao giờ cần được xét lại khi relax các cạnh vào đảo đó**. Ta loại nó khỏi tập các khoảng còn có thể được relax. Chỉ khoảng giao đầu tiên có thể còn cần được xét trong các lần relax sau.

Đó là lý do tổng số lần duyệt các khoảng không bị nhân lên theo số hải trình.

### Cài đặt và phân tích độ phức tạp

Đối với mỗi đảo, lưu các khoảng được phép chưa bị “chốt” trong một cấu trúc `set` của STL, sắp theo đầu trái. Một phép relax hải trình gồm ba phần:

1. Tìm khoảng đầu tiên \([a_1,b_1]\) giao với đoạn đến được (1). Việc này mất \(O(\log p)\).
2. Relax \([a_1,b_1]\). Thao tác này có thể cần cập nhật hàng đợi ưu tiên của Dijkstra, nên tính là \(O(\log(n+p))\).
3. Duyệt các khoảng giao còn lại \([a_2,b_2],\ldots,[a_k,b_k]\), gán khoảng cách của chúng bằng đầu trái tương ứng, đưa chúng vào hàng đợi ưu tiên, rồi xóa chúng khỏi `set` của đảo đích.

Mỗi khoảng được phép, khi đã là khoảng không phải đầu tiên trong một phép relax, chỉ bị xóa như vậy nhiều nhất một lần. Do đó tổng chi phí của phần 3 trên mọi hải trình là

\[
O((n+p)\log(n+p)).
\]

Một khoảng được phép đã được lấy ra bởi Dijkstra chỉ relax các hải trình từ đảo của nó. Mỗi đảo có không quá \(10\) hải trình đi ra, nên tổng số phép relax là \(O(n+p)\). Vì thế tổng chi phí của hai phần đầu cũng là

\[
O((n+p)\log(n+p)).
\]

Cuối cùng, Dijkstra thực hiện \(O(n+p)\) thao tác lấy phần tử nhỏ nhất từ hàng đợi ưu tiên, mỗi thao tác mất \(O(\log(n+p))\). Việc dựng các khoảng được phép ban đầu mất

\[
O(n+p\log p),
\]

do cần gom và sắp xếp các khoảng cạm bẫy. Tổng độ phức tạp của thuật toán là

\[
O((n+p)\log(n+p)).
\]

Bản cài đặt là phần khó nhất của bài: cần xử lý cẩn thận các đầu mút khoảng, phần tử đã bị xóa khỏi `set`, và các bản ghi cũ trong hàng đợi ưu tiên. Đây cũng là lý do trong kỳ thi, chỉ có bốn đội giải được bài *Heros*.
