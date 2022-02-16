# 学习ggplot2库,参考以下链接
# https://www.ling.upenn.edu/~joseff/avml2012/
library("ggplot2")

pie <- ggplot(mtcars, aes(x = factor(1), fill = factor(cyl))) +
  geom_bar(width = 1, position = "fill", color = "black")
pie

pie + coord_polar(theta = "y")
?geom_jitter

I_jean <- read.delim("http://bit.ly/avml_ggplot2_data")
I_jean
p <- ggplot(I_jean, aes(x = Dur_msec, y = F1.n))
p

p <- p + geom_point()

ggplot(I_jean, aes(x=Dur_msec, y=F1.n)) +
  geom_point(shape = 3)

ggplot(I_jean, aes(x=Dur_msec, y=F1.n)) +
  geom_point(color = "red", size = 3)

p <- p + stat_smooth()
p

ggplot(I_jean, aes(x = Dur_msec, y = F1.n))+
  stat_smooth()


p <- p + scale_x_log10(breaks = c(50, 100,200,300,400))+
  scale_y_reverse()
p

p <- p + ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme_bw()+
  opts(title = "394 tokens of 'I' from one speaker")
p

ggplot(I_jean, aes(x=Dur_msec, y=F1.n))+
  geom_point()+
  stat_smooth()+
  scale_x_log10(breaks = c(50, 100,200,300,400))+
  scale_y_reverse()+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme_bw()+
  opts(title = "394 tokens of 'I' from one speaker")

I_subset <- subset(I_jean, Word != "I")
ggplot(I_subset, aes(Dur_msec, F1.n, color = Word))+
  geom_point()


I_subset$Color <- c("black",
                    "red","blue",
                    "green","goldenrod")[I_subset$Word]

ggplot(I_subset, aes(Dur_msec, F1))+
  geom_point(color = I_subset$Color)

ggplot(I_subset, aes(Dur_msec, F1))+
  geom_point(color = "red")

ggplot(I_subset, aes(Dur_msec, F1, color = Color))+
  geom_point()


ggplot(I_subset, aes(Dur_msec, F1.n))+
  geom_point(aes(color=Word))+
  stat_smooth(se = F)
ggplot(I_subset, aes(Dur_msec, F1.n, shape=Word))+
  geom_point()


ggplot(I_jean, aes(Word))+
  geom_bar()


ggplot(I_jean, aes(Word, color = Word))+
  geom_bar()


ggplot(I_subset, aes(Name, fill = Word))+
  geom_bar()

ggplot(I_subset, aes(Name, fill = Word))+
  geom_bar(color = "black")
