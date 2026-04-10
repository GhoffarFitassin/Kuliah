import type { NextApiRequest, NextApiResponse } from "next";

type RevalidateResponse = {
  revalidated: boolean;
  message: string;
  path?: string;
};

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<RevalidateResponse>,
) {
  if (req.method !== "GET") {
    return res.status(405).json({
      revalidated: false,
      message: "Method not allowed. Use GET.",
    });
  }

  if (!process.env.REVALIDATE_TOKEN) {
    return res.status(500).json({
      revalidated: false,
      message: "REVALIDATE_TOKEN is not configured.",
    });
  }

  if (req.query.token !== process.env.REVALIDATE_TOKEN) {
    return res.status(401).json({
      revalidated: false,
      message: "Invalid token.",
    });
  }

  const path = req.query.path;

  if (typeof path !== "string" || !path.startsWith("/")) {
    return res.status(400).json({
      revalidated: false,
      message: "Invalid path. Use a string that starts with '/'.",
    });
  }

  try {
    await res.revalidate(path);
    return res.status(200).json({
      revalidated: true,
      message: "Revalidation successful.",
      path,
    });
  } catch (error) {
    console.error("On-demand revalidation error:", error);
    return res.status(500).json({
      revalidated: false,
      message: "Failed to revalidate page.",
      path,
    });
  }
}
