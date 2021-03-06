package com.jxt.util;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.ServletContext;

import magick.CompositeOperator;
import magick.ImageInfo;
import magick.Magick;
import magick.MagickException;
import magick.MagickImage;

import org.apache.commons.io.FileUtils;

import com.sun.imageio.plugins.bmp.BMPImageReader;
import com.sun.imageio.plugins.gif.GIFImageReader;
import com.sun.imageio.plugins.jpeg.JPEGImageReader;
import com.sun.imageio.plugins.png.PNGImageReader;


public class ImageUtil {
	
	private static final Color BACKGROUND_COLOR = Color.white;// 填充背景色
	private static final String DEST_FORMAT_NAME = "jpg";// 缩放、水印后保存文件格式名称
	private static final String JPEG_FORMAT_NAME = "jpg";// JPEG文件格式名称
	private static final String GIF_FORMAT_NAME = "gif";// GIF文件格式名称
	private static final String BMP_FORMAT_NAME = "bmp";// BMP文件格式名称
	private static final String PNG_FORMAT_NAME = "png";// PNG文件格式名称
	
	private static boolean isImageMagickEnable = false;
	
	static {
		try {
			System.setProperty("jmagick.systemclassloader", "no");
			new Magick();
			isImageMagickEnable = true;
		} catch (Throwable e) {
			isImageMagickEnable = false;
		}
	}
	
	/**
	 * 获取图片文件格式
	 * 
	 * @param imageFile
	 *            图片文件
	 * 
	 * @return 图片文件格式
	 */
	public static String getFormatName(File imageFile) {
		if (imageFile == null || imageFile.length() == 0) {
			return null;
		}
		try { 
			String formatName = null;
			ImageInputStream imageInputStream = ImageIO.createImageInputStream(imageFile);
			Iterator<ImageReader> iterator = ImageIO.getImageReaders(imageInputStream);
			if (!iterator.hasNext()) {
				return null;
			}
			ImageReader imageReader = iterator.next();
			if (imageReader instanceof JPEGImageReader) {
				formatName = JPEG_FORMAT_NAME;
			} else if (imageReader instanceof GIFImageReader) {
				formatName = GIF_FORMAT_NAME;
			} else if (imageReader instanceof BMPImageReader) {
				formatName = BMP_FORMAT_NAME;
			} else if (imageReader instanceof PNGImageReader) {
				formatName = PNG_FORMAT_NAME;
			}
			imageInputStream.close();
			return formatName; 
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 转换图片文件为JPEG格式
	 * 
	 * @param srcImageFile
	 *            源图片文件
	 *            
	 * @param destImageFile
	 *            目标图片文件
	 */
	public static void toJpegImageFile(File srcImageFile, File destImageFile) {
		if (srcImageFile == null) {
			return;
		}
		try {
			BufferedImage srcBufferedImage = ImageIO.read(srcImageFile);
			int width = srcBufferedImage.getWidth();
			int height = srcBufferedImage.getHeight();
			BufferedImage destBufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics2D graphics2D = destBufferedImage.createGraphics();
			graphics2D.setBackground(BACKGROUND_COLOR);
			graphics2D.clearRect(0, 0, width, height);
			graphics2D.drawImage(srcBufferedImage, 0, 0, null);
			graphics2D.dispose();
			ImageIO.write(destBufferedImage, DEST_FORMAT_NAME, destImageFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 复制图片文件至图片目录
	 * 
	 * @param imageFile
	 *            图片文件
	 *            
	 * @return 图片文件路径    
	 */
	public static String copyImageFile(ServletContext servletContext, File imageFile) {
		if (imageFile == null) {
			return null;
		}
		String formatName = getFormatName(imageFile);
		if (formatName == null) {
			throw new IllegalArgumentException("imageFile format error!");
		}
		String destImagePath = SettingUtil.getSetting().getImageUploadRealPath() + "/" + CommonUtil.getUUID() + "." + formatName;
		File destImageFile = new File(servletContext.getRealPath(destImagePath));
		File destImageParentFile = destImageFile.getParentFile();
		if (!destImageParentFile.isDirectory()) {
			destImageParentFile.mkdirs();
		}
		try {
			FileUtils.copyFile(imageFile, destImageFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return destImagePath;
	}
	
	/**
	 * 等比例图片缩小(AWT)
	 * 
	 * @param bufferedImage
	 *            需要处理的BufferedImage
	 *            
	 * @param destWidth
	 *            缩小后的图片宽度
	 *            
	 * @param destHeight
	 *            缩小后的图片高度
	 * 
	 * @return BufferedImage
	 */
	private static BufferedImage reduce(BufferedImage srcBufferedImage, int destWidth, int destHeight) {
		int srcWidth = srcBufferedImage.getWidth();
		int srcHeight = srcBufferedImage.getHeight();
		int width = destWidth;
		int height = destHeight;
		if (srcHeight >= srcWidth) {
			width = (int) Math.round(((destHeight * 1.0 / srcHeight) * srcWidth));
		} else {
			height = (int) Math.round(((destWidth * 1.0 / srcWidth) * srcHeight));
		}
		BufferedImage destBufferedImage = new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_INT_RGB);
		Graphics2D graphics2D = destBufferedImage.createGraphics();
		graphics2D.setBackground(BACKGROUND_COLOR);
		graphics2D.clearRect(0, 0, destWidth, destHeight);
		graphics2D.drawImage(srcBufferedImage.getScaledInstance(width, height, Image.SCALE_SMOOTH), (destWidth / 2) - (width / 2), (destHeight / 2) - (height / 2), null);
		graphics2D.dispose();
		return destBufferedImage;
	}
	
	
	/**
	 * 等比例图片缩小(ImageMagick)
	 * 
	 * @param srcMagickImage
	 *            需要处理的MagickImage
	 *            
	 * @param destWidth
	 *            缩小后的图片宽度
	 *            
	 * @param destHeight
	 *            缩小后的图片高度
	 * 
	 * @return MagickImage
	 */
	private static MagickImage reduce(MagickImage srcMagickImage, int destWidth, int destHeight) {
		MagickImage scaleMagickImage = null;
		MagickImage destMagickImage = null;
		try {
			Dimension dimension = srcMagickImage.getDimension();
			int srcWidth = (int) dimension.getWidth();
			int srcHeight = (int) dimension.getHeight();
			int width = destWidth;
			int height = destHeight;
			if (srcHeight >= srcWidth) {
				width = (int) Math.round(((destHeight * 1.0 / srcHeight) * srcWidth));
			} else {
				height = (int) Math.round(((destWidth * 1.0 / srcWidth) * srcHeight));
			}
			scaleMagickImage = srcMagickImage.scaleImage(width, height);
			destMagickImage = new MagickImage();
			byte[] pixels = new byte[destWidth * destHeight * 4];
			for (int i = 0; i < destWidth * destHeight; i ++) {
				pixels[4 * i] = (byte) 255;
				pixels[4 * i + 1] = (byte) 255;
				pixels[4 * i + 2] = (byte) 255;
				pixels[4 * i + 3] = (byte) 255;
			}
			destMagickImage.constituteImage(destWidth, destHeight, "RGBA", pixels);
			destMagickImage.compositeImage(CompositeOperator.AtopCompositeOp, scaleMagickImage, (destWidth / 2) - (width / 2), (destHeight / 2) - (height / 2));
		} catch (MagickException e) {
			if (destMagickImage != null) {
				destMagickImage.destroyImages();
			}
		} finally {
			if (srcMagickImage != null) {
				srcMagickImage.destroyImages();
			}
			if (scaleMagickImage != null) {
				scaleMagickImage.destroyImages();
			}
		}
		return destMagickImage;
	}
	
	
	
	/**
	 * 等比例图片缩小
	 * 
	 * @param srcFile
	 *            源图片文件
	 *            
	 * @param destFile
	 *            处理后的图片文件
	 *            
	 * @param destWidth
	 *            缩小后的图片宽度
	 *            
	 * @param destHeight
	 *            缩小后的图片高度
	 */
	public static void reduce(File srcFile, File destFile, int destWidth, int destHeight) {
		if (isImageMagickEnable) {
			MagickImage srcMagickImage = null;
			MagickImage destMagickImage = null;
			try {
				ImageInfo imageInfo = new ImageInfo(srcFile.getAbsolutePath());
				srcMagickImage = new MagickImage(imageInfo);
				destMagickImage = reduce(srcMagickImage, destWidth, destHeight);
				destMagickImage.setFileName(destFile.getAbsolutePath());
				destMagickImage.writeImage(imageInfo);
			} catch (MagickException e) {
				e.printStackTrace();
			} finally {
				if (srcMagickImage != null) {
					srcMagickImage.destroyImages();
				}
				if (destMagickImage != null) {
					destMagickImage.destroyImages();
				}
			}
		} else {
			try {
				BufferedImage srcBufferedImage = ImageIO.read(srcFile);
				BufferedImage destBufferedImage = reduce(srcBufferedImage, destWidth, destHeight);
				ImageIO.write(destBufferedImage, DEST_FORMAT_NAME, destFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}