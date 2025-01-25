type Params = {
  params: Promise<{
    slug: string;
  }>;
};

export default async function Page({ params }: Params) {
  const { slug } = await params;
  return <h1>Slug: {slug}</h1>;
}
