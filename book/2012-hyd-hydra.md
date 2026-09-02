# Hydra ★★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Tomasz Idziaszek  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `hyd`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2012/hyd>


## Đề bài

Cậu bé Bytie nhận được một trò chơi điện tử nhân dịp sinh nhật, mang tên *Những cuộc phiêu lưu kỳ thú của hiệp sĩ Byteasar*. Mục tiêu của trò chơi là điều khiển hiệp sĩ vượt qua rất nhiều thử thách, đánh bại kẻ xấu và phù thủy độc ác, rồi giải cứu các cô gái gặp nạn. Bytie đã hoàn thành gần hết các màn chơi. Giờ cậu bị kẹt ở màn cuối, nơi Byteasar phải chiến đấu với một con rắn khổng lồ: **Hydra Bytean**.

Byteasar sẽ dùng kiếm để chiến đấu với quái vật. Trò chơi có hai kiểu vung kiếm: Byteasar có thể **chặt đứt** đầu rắn, hoặc **nghiền nát** đầu rắn (dĩ nhiên đòn thứ hai tốn sức hơn). Chặt đứt đầu thì đơn giản hơn, nhưng khiến các đầu mới mọc lại từ cổ rắn. Hydra chỉ bị đánh bại khi nó không còn đầu nào và không đầu mới nào có thể mọc lại.

Hydra Bytean có \(n\) loại đầu, được đánh số từ \(1\) đến \(n\). Ban đầu con rắn có đúng một đầu loại \(1\). Một đầu loại \(i\) (\(1\le i\le n\)) được đặc trưng bởi:

- \(u_i\): số nhát kiếm cần để chặt đứt đầu đó;
- \(z_i\): số nhát kiếm cần để nghiền nát đầu đó;
- một danh sách gồm \(r_i\) loại đầu \(g_{i,1},\ldots,g_{i,r_i}\), là các đầu mọc thay cho đầu loại \(i\) nếu nó bị chặt đứt.

Hãy giúp Bytie tính số nhát kiếm ít nhất cần dùng để đánh bại Hydra.

### Dữ liệu vào

Dòng đầu chứa số nguyên \(n\) (\(1\le n\le200\,000\)), là số loại đầu của Hydra.

\(n\) dòng tiếp theo mô tả các loại đầu; dòng thứ \(i\) mô tả đầu loại \(i\). Dòng này bắt đầu bằng ba số nguyên \(u_i,z_i,r_i\) (\(1\le u_i<z_i\le10^9\), \(1\le r_i\)), tiếp theo là \(r_i\) số nguyên \(g_{i,1},\ldots,g_{i,r_i}\) (\(1\le g_{i,j}\le n\)). Tổng tất cả các giá trị \(r_i\) không vượt quá \(1\,000\,000\).

### Dữ liệu ra

In một số nguyên duy nhất: số nhát kiếm tối thiểu cần để hoàn thành trò chơi.

### Ví dụ

Với dữ liệu vào:

```text
4
4 27 3 2 3 2
3 5 1 2
1 13 2 4 2
5 6 1 2
```

kết quả đúng là:

```text
26
```

## Lời giải

Ta sẽ tính nhiều hơn điều đề bài yêu cầu. Với từng loại đầu \(i\), hãy xác định số nhát kiếm ít nhất để giết một Hydra mà đầu duy nhất của nó có loại \(i\); gọi giá trị đó là \(\operatorname{cost}[i]\). Đáp án cần in sẽ là \(\operatorname{cost}[1]\).

Để tiêu diệt Hydra có đầu loại \(i\), có hai lựa chọn. Ta hoặc nghiền nát ngay đầu đó với \(z_i\) nhát kiếm, hoặc chặt nó với \(u_i\) nhát rồi độc lập tiêu diệt tất cả các đầu mọc lên thay thế. Gọi \(G_i\) là **danh sách** các đầu này; nếu một loại đầu xuất hiện nhiều lần trong danh sách thì mỗi lần xuất hiện đều phải được tính. Khi đó:

\[
\operatorname{cost}[i]
=\min\left(z_i,\;u_i+\sum_{j\in G_i}\operatorname{cost}[j]\right). \tag{1}
\]

Vì mọi danh sách \(G_i\) đều không rỗng, một thuật toán đệ quy trực tiếp theo (1) chắc chắn sẽ rơi vào vòng lặp. Vấn đề là phải chọn được thứ tự tính các giá trị \(\operatorname{cost}\).

### Một loại đầu có thể tính ngay

Xét một loại đầu \(i\) có giá trị \(z_i\) nhỏ nhất. Để giết Hydra bắt đầu với đầu loại \(i\), cuối cùng ta phải nghiền nát ít nhất một đầu nào đó: chỉ chặt đầu thì sẽ luôn có đầu mới mọc ra. Với mọi loại đầu \(j\), ta có \(z_j\ge z_i\), nên bất cứ chiến lược nào cũng tốn ít nhất \(z_i\) nhát kiếm. Vì vậy, cách tốt nhất là nghiền nát đầu \(i\) ngay từ đầu, và

\[
\operatorname{cost}[i]=z_i.
\]

Thuật toán dưới đây là sự tổng quát hóa của nhận xét này.

### Các pha của thuật toán

Thuật toán hoạt động theo nhiều pha. Gọi \(C\) là tập các loại đầu mà giá trị \(\operatorname{cost}\) đã được xác định; ban đầu \(C\) rỗng. Trước pha đầu tiên và sau mỗi pha, ta duy trì bất biến

\[
G_i\subseteq C\quad\Longrightarrow\quad i\in C.
\]

Nói cách khác, nếu \(\operatorname{cost}[i]\) chưa biết (\(i\notin C\)), thì ít nhất một đầu trong danh sách \(G_i\) vẫn chưa có chi phí được xác định.

Ở đầu mỗi pha, chọn một loại đầu \(i\notin C\) có \(z_i\) nhỏ nhất. Ta khẳng định rằng nghiền nát ngay đầu này là tối ưu, nên có thể đặt

\[
\operatorname{cost}[i]=z_i
\]

và thêm \(i\) vào \(C\).

Thật vậy, giả sử thay vào đó ta chặt đầu \(i\). Do bất biến, trong các đầu mọc ra có một đầu \(j_1\notin C\). Nếu chặt đầu \(j_1\), lại có một đầu mới \(j_2\notin C\); cứ tiếp tục như vậy. Ta nhận được dãy vô hạn các loại đầu

\[
i,j_1,j_2,\ldots
\]

không loại nào thuộc \(C\). Muốn tiêu diệt Hydra, tại một thời điểm ta bắt buộc phải nghiền nát một đầu thuộc dãy này. Nhưng \(i\) có giá trị \(z\) nhỏ nhất trong tất cả các loại chưa thuộc \(C\), nên lần nghiền nát ấy tốn ít nhất \(z_i\) nhát kiếm. Vì thế, chiến lược nào cũng tốn ít nhất \(z_i\); nghiền nát đầu \(i\) ngay lập tức đạt đúng cận này.

Sau khi thêm \(i\) vào \(C\), ta khôi phục bất biến. Chừng nào còn tìm được một loại đầu \(k\notin C\) thỏa \(G_k\subseteq C\), tính \(\operatorname{cost}[k]\) theo (1) rồi thêm \(k\) vào \(C\). Những loại như vậy có thể được xử lý liên tiếp trong cùng pha.

### Cài đặt hiệu quả

Để nhanh chóng tìm loại đầu có \(z_i\) nhỏ nhất ở đầu mỗi pha, ban đầu hãy sắp xếp các loại đầu theo thứ tự không giảm của \(z_i\). Sau đó duyệt danh sách này theo thứ tự đó và bỏ qua một loại đầu nếu chi phí của nó đã được tính ở một pha trước.

Để thực hiện hiệu quả phần khôi phục bất biến, dựng một đồ thị có hướng gồm \(n\) đỉnh tương ứng với các loại đầu. Với mỗi lần xuất hiện \(j\in G_i\), thêm một cạnh \((j,i)\). Cạnh đi vào đỉnh \(i\) thể hiện rằng chưa thể dùng công thức (1) để tính \(\operatorname{cost}[i]\), vì \(\operatorname{cost}[j]\) còn chưa biết.

Khi thêm loại đầu \(j\) vào \(C\), xóa đỉnh \(j\) và tất cả các cạnh đi ra từ nó. Duy trì bậc vào của từng đỉnh. Mỗi khi bậc vào của một đỉnh \(i\) giảm về \(0\), mọi đầu trong \(G_i\) đã thuộc \(C\), nên tính \(\operatorname{cost}[i]\) theo (1), thêm \(i\) vào \(C\), rồi tiếp tục xóa nó và các cạnh đi ra. Để tính nhanh tổng trong (1), khi một đầu \(j\) được thêm vào \(C\), cộng \(\operatorname{cost}[j]\) vào tổng đang chờ của mọi đỉnh \(i\) có cạnh \((j,i)\).

Mỗi loại đầu và mỗi cạnh chỉ bị xử lý hằng số lần. Việc sắp xếp theo \(z_i\) tốn \(O(n\log n)\) thời gian. Vì vậy, với \(R=\sum_i r_i\), tổng độ phức tạp là

\[
O(n\log n+R)
\]

về thời gian và

\[
O(n+R)
\]

về bộ nhớ.

> **Ghi chú.** Về bản chất, thuật toán này gợi nhớ một phương pháp sắp xếp tô-pô trên đồ thị có hướng không chu trình, mặc dù đồ thị ở đây hoàn toàn có thể chứa chu trình.
